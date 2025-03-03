# Python script to make figures of the concentrations in KPP
# novak004 08-05-2024

#!/usr/bin/env python3
# import important modules
import numpy as np
import matplotlib
matplotlib.use('Agg')  # Use the Agg backend which does not require GUI
import matplotlib.pyplot as plt
import pandas as pd
import sys
import re

plt.ion()

# Function to convert decimal hours to HH:MM format
def decimal_to_time(decimal_hour, start_date):
    # Round the decimal part to the nearest 0.25 (15 minutes)
    rounded_decimal = np.round(decimal_hour * 4) / 4
    # Compute total minutes from start
    total_minutes = (rounded_decimal - 12) * 60
    # Calculate the datetime by adding timedelta to the start_date
    return start_date + pd.to_timedelta(total_minutes, unit='min')
    
def extract_species_names(headers_path):
    """ Extract species names from a C-style array declaration in a text file. """
    with open(headers_path, 'r') as file:
        content = file.read()
    pattern = re.compile(r'\{\s*"(.*?)"\s*\}', re.DOTALL)
    match = pattern.search(content)
    if match:
        # Split the matched string by comma and strip each element
        species_names = [name.strip().replace('"', '') for name in match.group(1).split(',')]
        return species_names
    return []

def main():
#    if len(sys.argv) < 2:
#        print("Usage: python plot_chemical_conc.py [CHEMICAL_SPECIES]")
#        sys.exit(1)

#    chemical_species = sys.argv[1]

    path = '/home/WUR/novak004/KPP/examples/'
    headers_path = path + 'barth_Monitor.c'
    headers = ['time'] + extract_species_names(headers_path)
    
    df = pd.read_csv(path + 'barth.dat', header=None, delim_whitespace=True)
    if len(headers) != df.shape[1]:
        raise ValueError(f"Header and column count mismatch. Expected {len(headers)} headers, found {df.shape[1]}.")
    else:
        df.columns = headers
        print(headers)

    start_date = pd.Timestamp('2024-01-01 12:00')
    df['time'] = df['time'].apply(lambda x: decimal_to_time(x, start_date))
    df.set_index('time', inplace=True)
    
    # Ensure that the column headers correctly include all species names
    if 'time' in df.columns:
        species_columns = df.columns.drop('time')  # Exclude 'time' from the plotting columns
    else:
        species_columns = df.columns

    for species in species_columns:
        if species in species_columns:
            plt.figure(figsize=(10, 6))
            plt.plot(df.index, df[species], label=species)
            plt.title(f'Time Series of {species} Concentration')
            plt.xlabel('Time')
            plt.ylabel('Concentration')
            plt.legend()
            plt.grid(True)
            # Dynamic plot filename based on chemical species
            plot_filename = f"{species} _conc_plot.png"
            save_path = '/home/WUR/novak004/boxmodel/barth/barth2003/clearsky/'
            plt.savefig(save_path + plot_filename) # saves the plot in the specified path
            print(f"Plot saved as '{plot_filename}' in '{save_path}'")
            plt.close()
        else:
            print(f"Chemical species '{species}' not found in the data.")

if __name__ == "__main__":
    main()

