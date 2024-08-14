import pandas as pd

# Load the CSV file
csv_file_path = 'NegativeCSV.csv'  # replace with your file path
df = pd.read_csv(csv_file_path)

# Specify the column name
column_name1 = 'Offense.Type'  # replace with your column name
column_name2 = 'Discretion'
column_name3 = 'Duration'

# Count the number of unique values in the column
unique_values1 = df[column_name1].unique()
unique_values2 = df[column_name2].unique()
unique_values3 = df[column_name3].unique()

print(f'The unique values in the column "{column_name1}" are:')
print(unique_values1)

print(f'The unique values in the column "{column_name2}" are:')
print(unique_values2)

print(f'The unique values in the column "{column_name3}" are:')
print(unique_values3)