#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <dir> <n>" 1>&2
    exit 1
fi

# Assign the arguments to variables
dir="$1"
n="$2"

# Check if the directory exists
if [ ! -d "$dir" ]; then
    echo "$0: Error: Directory '$dir' does not exist." 1>&2
    exit 1
fi

# Use 'find' to locate files larger than 'n' bytes and remove them
find "$dir" -type f -size +"$n"c -exec rm -f {} \;

# Inform the user about the completed operation
echo "$0: Removed files larger than $n bytes in directory '$dir'."

