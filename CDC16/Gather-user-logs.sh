#!/usr/bin/env bash
# when using [[ ]] dont forget to use bash instead of !/bin/sh

echo "test"
# Read a file (data stream, variable) line-by-line or field by field
#while IFS= read -r line; do
#    printf '%s\n' "$line"
#done < "$file"


grep /home /etc/passwd | cut -d':' -f6 - | while IFS= read -r line; do
    printf '%s\n' "$line"
    cd "$line"
    for FILE in $(ls -a); do
        if [ -f "$FILE" ] && [[ "$FILE" == .bash* ]]; then    # the conditional order must be as follow. [[]] lack portability but allows better expansion
            echo "found file: $FILE"
            cat "$FILE" > file.txt
        elif [ -f "$FILE" ] && [[ "$FILE" == .mysql* ]]; then
            echo "found file: $FILE"
        elif [ -f "$FILE" ] && [[ "$FILE" == .vim* ]]; then
            echo "found file: $FILE"
        elif [ -f "$FILE" ] && [[ "$FILE" == .pro* ]]; then
            echo "found file: $FILE"
        elif [ -f "$FILE" ] && [[ "$FILE" == *.sql ]]; then
            echo "found file: $FILE"
        elif [ -f "$FILE" ] && [[ "$FILE" == *.log ]]; then
            echo "found file: $FILE"
        elif [ -f "$FILE" ] && [[ "$FILE" == .emac* ]]; then
            echo "found file: $FILE"
        fi
    done
done
