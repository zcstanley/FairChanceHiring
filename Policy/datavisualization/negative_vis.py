import pandas as pd
import plotly.express as px
import numpy as np
from us import states

csv_file_path = 'negative_index.csv'  # replace with your file path
df = pd.read_csv(csv_file_path)

def get_combo(row):
    return row['Consequence Count'] * row['Average Law Index']

df['CombinedCountIndex'] = df.apply(get_combo, axis=1)

# get the abbrviation
def state_name_to_abbr(state_name):
    state_name = state_name.strip()
    state = states.lookup(state_name.title())
    return state.abbr if state else None

def get_state_name_to_abbr(row):
    return state_name_to_abbr(row['State'])

df['StateAbbr'] = df.apply(get_state_name_to_abbr, axis=1)

print(df)

# Choropleth map
fig = px.choropleth(df,
                    locations='StateAbbr',
                    locationmode='USA-states',
                    # color='CombinedCountIndex',
                    # color='Consequence Count',
                    color='Average Law Index',
                    scope='usa',
                    # color_continuous_scale='Viridis',
                    color_continuous_scale='Viridis_r',
                    title='Average Negative Law Index by State')
fig.show()