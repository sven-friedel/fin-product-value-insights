import pandas as pd

# Load your data
df = pd.read_csv('Assets/Dataset/Raw_Dataset/users_data.csv')

# Clean the currency columns
cols_to_clean = ['per_capita_income', 'yearly_income', 'total_debt']

for col in cols_to_clean:
    # Remove $ and commas, then convert to numeric
    df[col] = df[col].replace(r'[\$,]', '', regex=True).astype(float)

# Save it back to a "clean" CSV for the database import
df.to_csv('Assets/Dataset/Clean_Dataset/clean_users_data.csv', index=False)
