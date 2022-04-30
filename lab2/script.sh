#!/bin/bash -eu

if [[ $# -ne 2 ]]; then
    echo "Bledna liczba parametrow"
    exit 1
fi

FIRST_PATH=$1 
SECOND_PATH=$2

if [[ ! -d "${FIRST_PATH}" ]] || [[ ! -d "${SECOND_PATH}" ]]; then
    echo "Podana sciezka nie istnieje"
    exit 1
fi


cd "$FIRST_PATH"

for FILE in *; do
    if [[ -d $FILE ]]; then 
        echo "${FILE} to katalog"
        upcase=${FILE^^}_ln;
        ln -s "$FILE" "$SECOND_PATH$upcase";
    elif [[ -f $FILE ]]; then
        echo "${FILE} to plik regularny";
        name="${FILE%.*}";
        end="${FILE#*.}";
        upcase=${name^^*}_ln.$end;
        ln -s "$FIRST_PATH/$FILE" "$SECOND_PATH$upcase";
    elif [[ -L $FILE ]]; then
        echo "${FILE} to dowiazanie symboliczne"
    fi
done