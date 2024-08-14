import pandas as pd

# Go through the data frame 

# Start with calculating just the state policies 

# 4 catagories 
# type of employers 
def get_employer(row):
    total = 0
    if row['Location'].strip().isupper():
        if isinstance(row['Private'], str):
            total += (0.8)
        if isinstance(row['Vendors'], str):
            total += (0.05)
        if isinstance(row['Public'], str):
            total += (0.15)
    return total

# background checks
def get_backgroundcheck(row):
    total = 0
    if row['Location'].strip().isupper():
        if isinstance(row['Background checks for some positions'], str):
            total += (0.5)
        if isinstance(row['Background check only after offer or finalists'], str):
            total += (0.5)
    return total

# eeoc criteria
def get_EEOC(row):
    total = 0
    if row['Location'].strip().isupper() and isinstance(row['EEOC Criteria'], str):
        total = 1
    return total

# Notice of denial (N); Copy of record (C); Appeal or complaint (A)
def get_NCA(row):
    total = 0
    val = row['NCA'] 
    if row['Location'].strip().isupper() and isinstance(val, str):
        if 'N' in val:
            total += (0.33)
        if 'C' in val:
            total += (0.33)
        if 'A' in val:
            total += (0.34)
    return total

# total index
def get_place_index(row):
    return (row["Employer Index"] + row["Background Check Index"] + row["EEOC Index"]
             + row["NCA Index"]) / 4 
    


# Load the CSV file
csv_file_path = 'banthebox_with_population.csv'  # replace with your file path
df = pd.read_csv(csv_file_path)

# Add a new column for each index
df['Employer Index'] = df.apply(get_employer, axis=1)
df['Background Check Index'] = df.apply(get_backgroundcheck, axis=1)
df['EEOC Index'] = df.apply(get_EEOC, axis=1)
df['NCA Index'] = df.apply(get_NCA, axis=1)
df['Place Index'] = df.apply(get_place_index, axis=1)



# Save the updated DataFrame to a new CSV file
df.to_csv('state_ban_the_box_index.csv', index=False)