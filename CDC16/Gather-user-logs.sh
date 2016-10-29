#!/usr/bin/env bash
# when using [[ ]] dont forget to use bash instead of !/bin/sh

# Read a file (data stream, variable) line-by-line or field by field
#while IFS= read -r line; do
#    printf '%s\n' "$line"
#done < "$file"

# Grab home directories from passwd by cut delimited by : , then read each line
grep /home /etc/passwd | cut -d':' -f6 - | while IFS= read -r line; do
    # Be weary of using echo inserting unwanted and difficult to remove special characters
#    printf '%s\n' "$line"
    cd "$line"
    shopt -s dotglob
    for FILE in *; do
        # the conditional order must be as follow (-f xxx). [[]] lack portability but allows better expansion
        if [[ -f "$FILE" ]] && [[ "$FILE" == .bash* ]]; then
#            printf 'Found "%s"\n' "$FILE"
            cat "$FILE" > "$line$FILE.txt"
        elif [ -f "$FILE" ] && [[ "$FILE" == .mysql* ]]; then
            cat "$FILE" > "$line$FILE.txt"
        elif [ -f "$FILE" ] && [[ "$FILE" == .vim* ]]; then
            cat "$FILE" > "$line$FILE.txt"
        elif [ -f "$FILE" ] && [[ "$FILE" == .pro* ]]; then
            cat "$FILE" > "$line$FILE.txt"
        elif [ -f "$FILE" ] && [[ "$FILE" == *.sql ]]; then
            cat "$FILE" > "$line$FILE.txt"
        elif [ -f "$FILE" ] && [[ "$FILE" == *.log ]]; then
            cat "$FILE" > "$line$FILE.txt"
        elif [ -f "$FILE" ] && [[ "$FILE" == .emac* ]]; then
            cat "$FILE" > "$line$FILE.txt"
        elif [ -f "$FILE" ] && [[ "$FILE" == .nan* ]]; then # nano may be exclusively a folder first, not a file.
            cat "$FILE" > "$line$FILE.txt"
        fi
    done
    printf 'Found %s\n' "$line"
done

# Archive files -------------------------
echo
echo "Would you like to compress all these files for easy transfer?"
read -p "Press y or n (lowercase): " userChoice1

if [ "$userChoice1" = "y" ]; then
    cd /home; tar cvf /home/Users-Forencic-Logs.tar *.*
    echo "Compression completed"
    echo
else
    echo "No compression selected"
    echo
fi

# Cleanup -------------------------
echo "Would you like to remove all these newly created files?"
read -p "Press y or n (lowercase): " userChoice2

if [ "$userChoice2" = "y" ]; then
    for file in "/home/"*.txt; do
        if [[ -f "$file" ]]; then
#            printf 'Removing file "%s"\n' "$file"
            rm rm -f "$file"
        fi
    done
    echo "Cleanup completed. Apu: Thank you come again"
else
    echo "Removal not selected"
fi

read -p "Check /home for files"
