#!/bin/bash

# ./mean.sh <column> [file.csv]
col="$1"
file="$2"

# To check whether <column> is a positive integer
if [[ ! "$col" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: Invalid column number '$col'."
    exit 1
fi

# To check whether [file.csv] exists and is valid
if [ -n "$file" ]; then
    # Check if the file exists
    if [ ! -f "$file" ]; then
        echo "Error: File '$file' does not exist."
        exit 1
    fi
    # Use the specified file
    input="$file"
else
    # Read from stdin
    input="/dev/stdin"
fi

# Calculating mean of the column
tail -n +2 "$file" | cut -d',' -f"$col" |
    { fail=0
      sum=0
      count=0;
      while read value;
      do
	  if [[ $value =~ ^[0-9]*[.]?[0-9]*$ ]]; then
	      sum=$(echo "scale=6; $sum + $value" | bc)
	      count=$(($count + 1));
	  else
	      echo "Invalid column format, only integers, doubles, or floats."
	      fail=1
	      break
	  fi;
      done
      if [[ $fail -eq 0 ]]; then
	  echo "scale=6; $sum / $count" | bc
      fi; }
