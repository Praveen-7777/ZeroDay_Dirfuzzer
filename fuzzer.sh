#!/bin/bash

# Directory Fuzzing Script
# Usage: ./directory_fuzzer.sh <domain> <wordlist>

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <domain> <wordlist>"
    exit 1
fi

# Variables
DOMAIN=$1
WORDLIST=$2

# Check if the wordlist file exists
if [ ! -f "$WORDLIST" ]; then
    echo "Error: Wordlist file '$WORDLIST' not found!"
    exit 1
fi

# Fuzzing
echo "Starting directory fuzzing on domain: $DOMAIN"
echo "Using wordlist: $WORDLIST"
echo "--------------------------------------------"

while read -r DIR; do
    URL="${DOMAIN}/${DIR}"
    RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
    
    if [ "$RESPONSE" -eq 200 ]; then
        echo "[FOUND] $URL (Status: $RESPONSE)"
    else
        echo "[NOT FOUND] $URL (Status: $RESPONSE)"
    fi
done < "$WORDLIST"

echo "--------------------------------------------"
echo "Directory fuzzing completed."
