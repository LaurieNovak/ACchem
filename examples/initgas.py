# Python script to read the last line of clear-sky (gas-phase only) concentrations of gasbarth.dat file
# and write it to an initialisation file for cloud simulation

import numpy as np
import pandas as pd
import re

# Function to read the last line of the .dat file
def read_last_line(file_name):
    with open(file_name, 'rb') as f:
        f.seek(-2, 2)
        while f.read(1) != b'\n':
            f.seek(-2, 1)
        last_line = f.readline().decode()
    return last_line

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

# Read the final concentrations
last_line = read_last_line('aqbarth.dat')
data = last_line.strip().split()
time = float(data[0])  # This is the time in hours
concentrations = list(map(float, data[1:]))

# Variable names corresponding to the order in the data file
path = '/home/WUR/novak004/KPP/examples/'
headers_path = path + 'aqbarth_Monitor.c'

variable_names = extract_species_names(headers_path)
print(variable_names)

# Create a dictionary for variable replacement
variables = dict(zip(variable_names, concentrations))

# Read the template initialization file
with open('template_initgas.def', 'r') as file:
    template = file.read()

# Replace placeholders with actual values
for var, value in variables.items():
    template = template.replace(f"{{{var}}}", str(value))

# Write the updated initialization file
with open('initgas.def', 'w') as file:
    file.write(template)


