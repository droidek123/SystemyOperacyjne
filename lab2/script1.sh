#!/bin/bash -eux

if [[ $# -ne 2 ]]; then
    echo "Bledna liczba parametrow"
    exit 1
fi

FIRST_PATH=$1 
SECOND_PATH=$2

if [[ ! -d "${FIRST_PATH}" ]] || [[ ! -f "${SECOND_PATH}" ]]; then
    echo "Podana sciezka nie istnieje"
    exit 1
fi

cd "$FIRST_PATH"

for FILE in *; do 
    if [[ -L "$FILE" ]]; then
        if ! [[ -e "$FILE" ]]; then
            name="${FILE%.*}";
            end="${FILE#*.}";
            unlink "$FILE"
            echo "${name^^*}$(date '+%Y-%m-%d').$end" >> "$SECOND_PATH"
        fi
    fi
done
