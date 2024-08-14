import pandas as pd

csv_file_path = 'negative_with_index.csv'  # replace with your file path
df = pd.read_csv(csv_file_path)

unique_states = df['Jurisdiction'].unique()

statute_count = {}
for state in unique_states: 
    statute_count[state] = df['Jurisdiction'].value_counts()[state]

def get_average_index(row):
    state = row['State']

    # add all TotalIndex for the state
    index_sum = df[(df['Jurisdiction'] == state)]['TotalIndex'].sum()

    # divide by state count
    average = index_sum / statute_count[state]

    # assign to specific row
    return average

state_overall = pd.DataFrame(list(statute_count.items()), columns=['State', 'Consequence Count'])

state_overall['Average Law Index'] = state_overall.apply(get_average_index, axis=1)

state_overall.to_csv('negative_overall_state_index.csv', index=False)

