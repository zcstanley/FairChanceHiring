import pandas as pd

df = pd.read_csv('EditedBanTheBoxCSV.csv')

# Create a DataFrame from the data
df['State'] = ''

# Iterate through rows to assign states
current_state = ''
for i, row in df.iterrows():
    if row['Location'].isupper():
        current_state = row['Location']
    else:
        df.at[i, 'State'] = current_state

# Print or further process the DataFrame
df.to_csv('bantheboxwithstates.csv', index=False)