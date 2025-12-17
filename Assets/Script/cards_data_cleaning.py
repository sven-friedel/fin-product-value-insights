import pandas as pd

df = pd.read_csv('Assets/Dataset/Raw_Dataset/cards_data.csv')

# Clean the currency columns
cols_to_clean = ['credit_limit']

for col in cols_to_clean:
    # Remove $ and commas, then convert to numeric
    df[col] = df[col].replace(r'[\$,]', '', regex=True).astype(float)

# Clean Date: Convert 09/2002 to 2002-09-01
df['expires'] = pd.to_datetime(df['acct_open_date'], format='%m/%Y').dt.strftime('%Y-%m-%d')
df['acct_open_date'] = pd.to_datetime(df['acct_open_date'], format='%m/%Y').dt.strftime('%Y-%m-%d')
df.to_csv('Assets/Dataset/Clean_Dataset/clean_cards_data.csv', index=False)
