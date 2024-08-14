import pandas as pd

# Go through the dataframe

# Value 1 is the strongest policy, so applying to most people (smallest crime
# is the worst ) 
def get_offense(row):
    offense = row["Offense.Type"]
    if isinstance(offense, str):
        offense = offense.lower() 
        # print(offense)
        if ("crime" in offense) or ("offense" in offense):
            return 1
        elif "misdemeanor" in offense: 
            return 0.8
        elif "felony" in offense:
            return 0.6
        elif "other" in offense:
            return 0.4
        elif ("n/a" in offense) or ( "background check" in offense) or ("general relief" in offense):
            return 0.2
        else:
            return 0
    else :
        return 0
        
    
# Value 1 is the strongest policy, so if law is mandantatory it applies to the 
# most people thus making it the worst
def get_discretion(row):
    discretion = row["Discretion"]
    # print(discretion)
    if isinstance(discretion, str): 
        # print(offense)
        discretion = discretion.lower()
        if ("mandatory" in discretion) or ("automatic" in discretion):
            # print(discretion)
            return 1 
        elif "background check" in discretion:
            return 0.6
        elif ("discretionary" in discretion) or ("varies" in discretion):
            return 0.3  
        else:
            return 0
    else :
        return 0


# Value of 1 is worst consequence, so longest duration is worst 
def get_duration(row):
    duration = row["Duration"]
    # print(discretion)
    if isinstance(duration, str): 
        # print(offense)
        duration = duration.lower()
        if "indefinite" in duration: 
            return 1
        elif "varies" in duration:
            return 0.75 
        elif "time-limited" in duration:
            return 0.5
        elif "conditional" in duration:
            return 0.4
        elif ("n/a" in duration) or ( "background check" in duration) or ("general relief" in duration):
            return 0.2  
        else:
            return 0
    else :
        return 0

def get_total(row):
    offense = row["OffenseIndex"]
    discretion = row["DiscretionIndex"]
    duration = row["DurationIndex"]

    return (offense + discretion + duration) / 3

# For each of the three catagories assign a number

# Take those numbers and calculate a final index


# Load the CSV file
csv_file_path = 'NegativeCSV.csv'  # replace with your file path
df = pd.read_csv(csv_file_path)

# Add a new column for each index
df['OffenseIndex'] = df.apply(get_offense, axis=1)
df['DiscretionIndex'] = df.apply(get_discretion, axis=1)
df['DurationIndex'] = df.apply(get_duration, axis=1)
df['TotalIndex'] = df.apply(get_total, axis=1)

# Save the updated DataFrame to a new CSV file
df.to_csv('negative_with_index.csv', index=False)