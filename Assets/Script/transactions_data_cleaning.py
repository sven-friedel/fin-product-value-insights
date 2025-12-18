import pandas as pd

df = pd.read_csv('Assets/Dataset/Raw_Dataset/transactions_data.csv')

# Remove $ from amount col
df['amount'] = df['amount'].replace(r'[\$,]', '', regex=True).astype(float)

#Fill in blanks in Merchant State with ONLINE
df['merchant_state'] = df['merchant_state'].fillna('ONLINE')

df.to_csv('Assets/Dataset/Clean_Dataset/clean_transactions_data.csv')
