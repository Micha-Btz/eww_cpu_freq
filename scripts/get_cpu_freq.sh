#!/bin/bash

# Get CPU frequency from all cores and output in JSON format

# Retrieve CPU frequencies
frequencies=($(lscpu | grep 'MHz' | awk '{print $3}'))

# Prepare JSON output
json_output="{\"cpu_frequencies\": ["

for freq in "${frequencies[@]}"; do
    json_output+="${freq}, "
done

# Remove trailing comma and space, close JSON array
json_output=${json_output%,*}
json_output+="]}"

# Print JSON output
echo -e "$json_output"