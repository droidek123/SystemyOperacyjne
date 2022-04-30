#!/bin/bash

SOURCE_DIR="${1:-lab_uno}"
RM_LIST="${2:-2remove.txt}"
TARGET_DIR="${3:-bakup}"

mkdir -p $TARGET_DIR

FILES_TO_RM=$(cat $RM_LIST)

cd $SOURCE_DIR
for FILE in *; do 
    for FILE_TO_RM in $FILES_TO_RM; do
        if [[ $FILE_TO_RM == $FILE ]]; then
            rm -rf $FILE_TO_RM
        fi
    done
done
cd ../

for FILE in $SOURCE_DIR/*; do
    if [[ -d $FILE ]]; then 
        cp -r $FILE $TARGET_DIR
    else
        mv $FILE $TARGET_DIR
    fi
done

COUNTER=$(ls $SOURCE_DIR | wc -l)

if [[ $COUNTER -eq 0 ]]; then
    echo "Tu był Kononowicz"
else 
    echo "Coś jeszcze zostało"
    if [[ $COUNTER -ge 2 ]]; then
        echo "Zostały co najmniej 2 pliki"
    fi
    if [[ $COUNTER -ge 4 ]]; then
        echo "Zostało więcej niż 4 pliki"
    fi
    if [[ $COUNTER -le 4 ]] && [[ $COUNTER -ge 2 ]]; then
        echo "Zostały co najmniej 2 pliki ale mniej niż 4"
    fi
fi

zip $(date +"%Y-%m-%d") $TARGET_DIR
