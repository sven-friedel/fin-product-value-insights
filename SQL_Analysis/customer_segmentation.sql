CREATE OR REPLACE VIEW card_value_db.view_customer_segments AS
WITH user_metrics AS (
    -- Step 1: Calculate raw R, F, M values per user
    SELECT
        Dim_Card_Dim_User_user_id as user_id,
        MAX(date) as last_transaction_date,
        -- Recency: Days since the most recent transaction in the entire dataset
        EXTRACT(DAY FROM (SELECT MAX(date) FROM card_value_db.Fact_Transactions) - MAX(date)) as recency,
        -- Frequency: Total count of transactions
        COUNT(*) as frequency,
        -- Monetary: Total spend
        SUM(amount) as monetary
    FROM card_value_db.Fact_Transactions
    WHERE errors IS NULL -- Only count successful transactions
    GROUP BY Dim_Card_Dim_User_user_id
),
rfm_scores AS (
    -- Step 2: Assign scores from 1-5 using NTILE
    -- Note: For Recency, a lower number is better, so we order by recency DESC
    SELECT
        *,
        NTILE(5) OVER (ORDER BY recency DESC) as r_score,
        NTILE(5) OVER (ORDER BY frequency ASC) as f_score,
        NTILE(5) OVER (ORDER BY monetary ASC) as m_score
    FROM user_metrics
),
segmentation AS (
    -- Step 3: Combine scores and define segments
    SELECT
        *,
        (r_score + f_score + m_score) / 3.0 as average_rfm_score,
        CASE
            WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Champions'
            WHEN r_score >= 3 AND f_score >= 3 AND m_score >= 3 THEN 'Loyal Customers'
            WHEN r_score >= 4 AND f_score <= 2 THEN 'New Customers'
            WHEN r_score <= 2 AND m_score >= 4 THEN 'At Risk - High Value'
            WHEN r_score <= 1 THEN 'Hibernating / Lost'
            ELSE 'Potential Loyalists'
        END as customer_segment
    FROM rfm_scores
)
-- Step 4: Final Output with User Details for Tableau
SELECT
    s.*,
    u.gender,
    u.yearly_income,
    u.credit_score,
    u.current_age
FROM segmentation s
JOIN card_value_db.Dim_User u ON s.user_id = u.user_id;
