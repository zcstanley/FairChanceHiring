import pandas as pd

# The four catagories of policy

# Type of employers 
def get_employer(row):
    total = 0
    # if row['Location'].strip().isupper():
    if isinstance(row['Private'], str):
        total += (0.8)
    if isinstance(row['Vendors'], str):
        total += (0.05)
    if isinstance(row['Public'], str):
        total += (0.15)
    return total

# Background Checks
def get_backgroundcheck(row):
    total = 0
    # if row['Location'].strip().isupper():
    if isinstance(row['Background checks for some positions'], str):
        total += (0.25)
    if isinstance(row['Background check only after offer or finalists'], str):
        total += (0.25)
    return total

# EEOC criteria
def get_EEOC(row):
    total = 0
    # if row['Location'].strip().isupper() and 
    if isinstance(row['EEOC Criteria'], str):
        total = 1
    return total

# Notice of denial (N); Copy of record (C); Appeal or complaint (A)
def get_NCA(row):
    total = 0
    val = row['NCA'] 
    if isinstance(val, str):
        if 'N' in val:
            total += (0.1666666)
        if 'C' in val:
            total += (0.1666666)
        if 'A' in val:
            total += (0.1666666)
    return total

# Total index: simple average
def get_place_index(row):
    return (row["Employer Index"] + row["Background Check Index"] + row["EEOC Index"]
             + row["NCA Index"]) / 3


def get_mid_overall(row):

    # States: copy the index into the new column
    if row['Location'].strip().isupper():
        return row['Place Index']
    
    # Cities and Counties: check each index

    else:
        state = row['State'].strip()
        # county has policy AND state doesn't cover
        county_index = 0

        # Get the row index of the state the county is in
        idx = df[df['Location'] == state].index
        state = idx[0]

        # County's percent of State population
        percent_pop = float(row['Population'])/float(df.at[state, 'Population'])

        # Check each index type to see if county has better policy than state
        # If it does, add to the overall index

        # Employer
        # if the city/county index is more than 0 and the state index is not full
        if row['Employer Index'] != 0 and df.at[state, 'Employer Index'] != 1:

            # check if private, vendors or public is the policy(ies) the state is missing
            if (not isinstance(df.at[state, 'Private'], str)) and (isinstance(row['Private'], str)):
                county_index += (0.8)

            if (not isinstance(df.at[state, 'Vendors'], str)) and (isinstance(row['Vendors'], str)):
                county_index += (0.05)

            if (not isinstance(df.at[state, 'Public'], str)) and (isinstance(row['Public'], str)):
                county_index += (0.15)

        # Background
        if row['Background Check Index'] != 0 and df.at[state,'Background Check Index'] != 1:
            if (not isinstance(df.at[state, 'Background checks for some positions'], str)) and (isinstance(row['Background checks for some positions'], str)):
                county_index += (0.25)

            if (not isinstance(df.at[state, 'Background check only after offer or finalists'], str)) and (isinstance(row['Background check only after offer or finalists'], str)):
                county_index += (0.25)

        # EEOC
        if row['EEOC Index'] != 0 and df.at[state, 'EEOC Index'] != 1:
            county_index += row['EEOC Index']

        # NCA
        if row['NCA Index'] != 0 and df.at[state, 'NCA Index'] != 1:
            val = row['NCA'] 

            # if there is nothing at state level, add all of city/county index
            if not isinstance(df.at[state, 'EEOC Index'], str):
                county_index += row['NCA Index']

            # otherwise check each letter
            else: 
                if ('N' in val) and (not ('N' in df.at[state, 'EEOC Index'])):
                    county_index += (0.1666666)

                if ('C' in val) and (not ('C' in df.at[state, 'EEOC Index'])):
                        county_index += (0.1666666)

                if ('A' in val) and (not ('A' in df.at[state, 'EEOC Index'])):
                        county_index += (0.1666666)
        
        # Calculate average and then multiply by the percentage population
        return (county_index / 3) * percent_pop


# Load the CSV file
csv_file_path = 'locations_with_population.csv'  # replace with your file path
df = pd.read_csv(csv_file_path)

# Clean Whitespace
df['Location'] = df['Location'].str.strip()
df['State'] = df['State'].str.strip()

# Add a new column for each index
print("calc index")
df['Employer Index'] = df.apply(get_employer, axis=1)
df['Background Check Index'] = df.apply(get_backgroundcheck, axis=1)
df['EEOC Index'] = df.apply(get_EEOC, axis=1)
df['NCA Index'] = df.apply(get_NCA, axis=1)
df['Place Index'] = df.apply(get_place_index, axis=1)


# Add column for overall state index (counties + state index)
df['Interim Index'] = df.apply(get_mid_overall, axis=1)

# List of unique states
unique_states = ["ALABAMA", "ALASKA", "ARIZONA", "ARKANSAS", "CALIFORNIA", "COLORADO", "CONNECTICUT", "DELAWARE", "FLORIDA", "GEORGIA", "HAWAII", "IDAHO", "ILLINOIS", "INDIANA", "IOWA", "KANSAS", "KENTUCKY", "LOUISIANA", "MAINE", "MARYLAND", "MASSACHUSETTS", "MICHIGAN", "MINNESOTA", "MISSISSIPPI", "MISSOURI", "MONTANA", "NEBRASKA", "NEVADA", "NEW HAMPSHIRE", "NEW JERSEY", "NEW MEXICO", "NEW YORK", "NORTH CAROLINA", "NORTH DAKOTA", "OHIO", "OKLAHOMA", "OREGON", "PENNSYLVANIA", "RHODE ISLAND", "SOUTH CAROLINA", "SOUTH DAKOTA", "TENNESSEE", "TEXAS", "UTAH", "VERMONT", "VIRGINIA", "WASHINGTON", "WEST VIRGINIA", "WISCONSIN", "WYOMING"]

# Empty column for final total indices
df['Total Index'] = ''

print("adding index")
# Adding the indices for each state
for state in unique_states:
    if isinstance(state, str):
        sum_value = df[(df['State'] == state) | (df['Location'] == state)]['Interim Index'].sum()
        # print(sum_value)
        #print(df['Location'])
        # print(state)
        idx = df[df['Location'] == state].index

        print(len(idx))
        if len(idx) > 0:
            state_row = idx[0]
            df.at[state_row, 'Total Index'] = sum_value

# Save the updated DataFrame to a new CSV file
df.to_csv('ban_the_box_index.csv', index=False)