import pandas as pd
import re
import glob

def strip_nonalnum_re(word):
    return re.sub(r"^\W+|\W+$", "", word)

def transform_csv(input_file, output_file):
    # Read the input CSV file
    df = pd.read_csv(input_file)
    
    # Initialize an empty list to store the transformed data
    transformed_data = []

    # Iterate over each column (category) in the DataFrame
    for category in df.columns:
        # Iterate over each state in the column
        for state in df[category].dropna():
            # Append a tuple of (state, category) to the transformed data list
            transformed_data.append((strip_nonalnum_re(state), category))
            # print(strip_nonalnum_re(state))

    # Create a new DataFrame from the transformed data
    transformed_df = pd.DataFrame(transformed_data, columns=['State', 'Category'])

    # Write the transformed DataFrame to a new CSV file
    transformed_df.to_csv(output_file, index=False)

# File paths
input_file_list = ['AuthorityExpunge.csv', 'AutomaticClear.csv', 'ProcessExpunge.csv', 'CertRelief.csv'] # Replace with your input file path
output_file = 'CertReliefOutput.csv'  # Replace with your desired output file path

count = 0

# Transform the CSV file
for csv in input_file_list: 
    # print(count)
    output_file = 'output' + str(count) + '.csv'
    # print(csv)
    transform_csv(csv, output_file)
    count = count + 1 

def combine_csvs(csv_files, output_file):
    # Initialize an empty DataFrame to store the combined data
    combined_df = pd.DataFrame()

    combined_df['State'] = []

    # Iterate over each CSV file
    for csv_file in csv_files:
        # Read the CSV file into a DataFrame
        df = pd.read_csv(csv_file)
        
        # Merge the current DataFrame with the combined DataFrame based on 'State' column
        # Use outer join to retain all states from all DataFrames
        combined_df = pd.merge(combined_df, df, on='State', how='outer')

    # Fill NaN values with appropriate data (e.g., 0, 'Not Available')
    # Modify as per your specific requirements
    combined_df = combined_df.fillna('Not Available')

    # Write the combined DataFrame to a new CSV file
    combined_df.to_csv(output_file, index=False)

# List of CSV files to combine
csv_files = ['output0.csv', 'output1.csv', 'output2.csv', 'output3.csv'] # Modify pattern as per your file locations

# Output CSV file path
output_file = 'combined_output.csv'  # Replace with your desired output file path

# Combine the CSV files
combine_csvs(csv_files, output_file)
