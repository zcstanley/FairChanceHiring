import pandas as pd

csv_file_path = 'ban_the_box_index_clean.csv'  # replace with your file path
ban_df = pd.read_csv(csv_file_path)

def capitalize_state_name(row):
    return row['Location'].title()

ban_df['State'] = ban_df.apply(capitalize_state_name, axis=1)

ban_df.to_csv('ban_the_box_index_state.csv', index=False)

# List of CSV files
csv_files = ['ban_the_box_index_state.csv', 'certificates_index.csv', 'clearing_index.csv', 'liablity_index.csv', 'licensing_index.csv']

# Creating a separate CSV with all the separate indexs

value_column_name = 'Value'

# Initialize an empty dictionary to store the DataFrames
dfs = {}

# Loop through the CSV files and read them into DataFrames
for i, file in enumerate(csv_files):
    df = pd.read_csv(file)
    # Ensure the DataFrame contains the 'State' and value columns
    if 'State' in df.columns and value_column_name in df.columns:
        # Select the 'State' and value columns
        df = df[['State', value_column_name]]
        # Rename the value column to ensure unique column names
        df.columns = ['State', f'Value_{i+1}']
        # Set the 'State' column as the index for easier merging
        df.set_index('State', inplace=True)
        dfs[f'df_{i+1}'] = df
    else:
        print(f"File {file} does not contain the necessary columns.")

# Initialize the final DataFrame with the 'State' column from the first CSV
final_df = dfs['df_1']

# Merge the remaining DataFrames into the final DataFrame
for i in range(2, 6):
    final_df = final_df.join(dfs[f'df_{i}'], how='outer')

# Reset the index to turn the 'State' index back into a column
final_df.reset_index(inplace=True)

final_df.to_csv('all_indiv_index.csv', index=False)


# Creating a CSV with the averaged values

# Initialize an empty dictionary to store state averages
state_averages = {}

# Iterate over each CSV file
for file in csv_files:
    # Read CSV file into DataFrame
    df = pd.read_csv(file)
    
    # Group by 'State' and calculate average 'Value'
    state_groups = df.groupby('State')['Value'].mean().reset_index()
    
    # Update state_averages dictionary with averaged values
    for _, row in state_groups.iterrows():
        state = row['State']
        avg_value = row['Value']
        if state in state_averages:
            state_averages[state].append(avg_value)
        else:
            state_averages[state] = [avg_value]

# Create a new DataFrame from state_averages dictionary
averaged_df = pd.DataFrame({
    'State': list(state_averages.keys()),
    'Average_Value': [sum(values) / len(values) for values in state_averages.values()]
})

# Save averaged DataFrame to a new CSV file
averaged_df.to_csv('averaged_data.csv', index=False)

print("Averaged data saved to 'averaged_data.csv'")