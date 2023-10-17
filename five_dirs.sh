#!/bin/bash

# Create the 'five' directory
mkdir -p five

# Iterate through subdirectories (dir1 to dir5)
for dir_num in {1..5}; do
    dir="five/dir$dir_num"
    mkdir -p "$dir"

    # Iterate through files (file1 to file4)
    for file_num in {1..4}; do
        file="$dir/file$file_num"
        # Create files with lines containing digits
        for ((line_num = 1; line_num <= file_num; line_num++)); do
            echo "$file_num" >> "$file"
        done
    done
done

