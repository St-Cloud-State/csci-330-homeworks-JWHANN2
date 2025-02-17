#!/bin/bash

# Compile the C++ Quicksort program
g++ -o quicksort NonRecursiveQuicksort.cpp

# Check if compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful. Running program..."
    ./quicksort
else
    echo "Compilation failed. Please check for errors."
fi
