#!/bin/bash

# Check if the output file was provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 output_file"
  exit 1
fi

# Get the output file from the first parameter
output_file=$1

while true; do
  # Log the current date and time
  timestamp=$(date +%Y-%m-%d_%H:%M:%S)

  # Get the current CPU temperature
  temp=$(sensors | grep "Tctl:" | awk '{print $2}')

  # Append the log to the temperature.csv file
  echo "$timestamp, $temp" 
  echo "$timestamp, $temp" >> $output_file

  # Wait for 1 second before repeating the loop
  sleep 5
done

