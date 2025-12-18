import pandas as pd
df = pd.read_csv('Assets/Dataset/Clean_Dataset/clean_transactions_data.csv')
print(f"Total Rows: {len(df)}")
print(f"Total Amount: {df['amount'].sum():.2f}")
