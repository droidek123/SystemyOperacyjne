#!/bin/bash -eu

#zad 1
# Znajdź w pliku access log 10 unikalnych adresow ip
cat access_log | grep -oP "\b(\d{1,3}\.){3}\d{1,3}\b" | sort -u | sed "10q"

# znajdź w pliku acceess log zapytania zawierajce fraze denied w linku
cat access_log | grep "denied" | cut -d" " -f1,6,7,8

# znajdź w pliku acceess log unikalne zapytania typu DELETE
cat access_log | grep "DELETE" | sort -u | cut -d" " -f6,7,8

# znajdź w pliku access_log zapytania wysłane z ip: 64.242.88.10
cat access_log | grep "64\.242\.88\.10 " | cut -d" " -f6,7,8

#zad2
# Z pliku yolo.csv wypisz wszystkich, których id jest liczbą nieparzystą. Wyniki zapisz na standardowe wyjście błędów.
cat yolo.csv | grep -P "^\d*[13579]," 1>&2

# Z pliku yolo.csv wypisz każdy numer IP, który w pierwszym i drugim oktecie ma po jednej cyfrze. Wyniki zapisz na standardowe wyjście błędów"
cat yolo.csv | cut -d"," -f6 | grep -P "^\b(\d\.){2}" 1>&2

# zad3
# We wszystkich plikach w katalogu ‘groovies’ zamień $HEADER$ na /temat/
find groovies/* -exec sed -i 's/\$HEADER\$/\/temat\//g' {} \;

# We wszystkich plikach w katalogu ‘groovies’ usuń linijki zawierające frazę 'Help docs:'"
find groovies/* -exec sed -i '/Help docs:/d' {} \;