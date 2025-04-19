#!/bin/bash
# clean.sh - Script to clean the buildroot environment

# Navigate to the buildroot directory and run make distclean
cd buildroot && make distclean

# Print confirmation message
echo "Buildroot cleaned successfully"

# Return to the original directory
cd ..
