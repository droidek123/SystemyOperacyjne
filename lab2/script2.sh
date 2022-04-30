#!/bin/bash -eu

if [[ $# -ne 1 ]]; then
    echo "Bledna liczba parametrow"
    exit 1
fi

FIRST_PATH=$1

if [[ ! -d "${FIRST_PATH}" ]]; then
    exit 1
fi

cd "$FIRST_PATH"
for FILE in *; do
    end="${FILE##*.}"
    if [[ $end == "bak" ]]; then
        if [[ -f $FILE ]]; then
            chmod uo-r "$FILE"
        elif [[ -d $FILE ]]; then
            chmod 001 "$FILE"
        fi
    elif [[ $end == "tmp" ]]; then
        if [[ -d $FILE ]]; then
            chmod 111 "$FILE"
        fi
    elif [[ $end == "txt" ]]; then
        if [[ -f $FILE ]]; then
            chmod 421 "$FILE"
        fi
    elif [[ $end == "exe" ]]; then
        if [[ -f $FILE ]]; then
            chmod 4111 "$FILE"
        fi
    fi
done