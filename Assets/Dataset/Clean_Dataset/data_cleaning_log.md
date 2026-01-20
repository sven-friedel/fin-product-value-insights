# Data cleaning log
### Scope:
1. cards_data.csv

| Step | Column Affected | Issue | Action Taken | Notes / Justification | Cleaned By |
|:---|:---|:---|:---|:---|:---|
| 1 | credit_limit | Column is a string but should be numeric | Implemented a python script which removes non numeric characters and converts remaining values to numeric | [cards_data_cleaning.py](https://github.com/sven-friedel/fin-product-value-insights/blob/main/Assets/Script/cards_data_cleaning.py) | Sven Friedel |
| 2 | expires | Date format (mm-yyyy) cannot be loaded into PostgreSQL | Converted date formats to (yyyy-mm-dd) via python script | [cards_data_cleaning.py](https://github.com/sven-friedel/fin-product-value-insights/blob/main/Assets/Script/cards_data_cleaning.py) | Sven Friedel |
| 3 | acct_open_date | Date format (mm-yyyy) cannot be loaded into PostgreSQL | Converted date formats to (yyyy-mm-dd) via python script | [cards_data_cleaning.py](https://github.com/sven-friedel/fin-product-value-insights/blob/main/Assets/Script/cards_data_cleaning.py) | Sven Friedel |

2. transactions_data.csv

| Step | Column Affected | Issue | Action Taken | Notes / Justification | Cleaned By |
|:---|:---|:---|:---|:---|:---|
| 1 | amount | values are string but should be numeric | removed non numeric characters and converted to numeric | [transactions_data_cleaning.py](https://github.com/sven-friedel/fin-product-value-insights/blob/main/Assets/Script/transactions_data_cleaning.py) | Sven Friedel |
| 2 | merchant_state | in case of online purchase all the values are blank | filled in blank with "ONLINE" to enable online vs. offline analysis | [transactions_data_cleaning.py](https://github.com/sven-friedel/fin-product-value-insights/blob/main/Assets/Script/transactions_data_cleaning.py) | Sven Friedel |
| 3 | zip | Is a float value but should be int to avoid any errors or issues | converted to int | [transactions_data_cleaning.py](https://github.com/sven-friedel/fin-product-value-insights/blob/main/Assets/Script/transactions_data_cleaning.py) | Sven Friedel |

3. users_data.csv

| Step | Column Affected | Issue | Action Taken | Notes / Justification | Cleaned By |
|:---|:---|:---|:---|:---|:---|
| 1 | per_capita_income | Column is a string but should be numeric | removed non numeric characters and converted to numeric | [users_data_cleaning.py](https://github.com/sven-friedel/fin-product-value-insights/blob/main/Assets/Script/users_data_cleaning.py) | Sven Friedel |
| 2 | yearly_income | Column is a string but should be numeric | removed non numeric characters and converted to numeric | [users_data_cleaning.py](https://github.com/sven-friedel/fin-product-value-insights/blob/main/Assets/Script/users_data_cleaning.py) | Sven Friedel |
| 3 | total_debt | Column is a string but should be numeric | removed non numeric characters and converted to numeric | [users_data_cleaning.py](https://github.com/sven-friedel/fin-product-value-insights/blob/main/Assets/Script/users_data_cleaning.py) | Sven Friedel |
