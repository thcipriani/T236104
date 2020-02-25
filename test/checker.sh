#!/usr/bin/env bash

while :; do
    CURL=$(curl -s 'http://localhost:8080/test.php' &)
    FILE=$(awk '/foo/ {print $3}' src/InitialiseSettings.php | tr -d ';')

    wait

    if [[ "$FILE" != "$CURL" ]]; then
        printf "[$(tput setaf 1)ERROR$(tput sgr0)] File is '%s' while curl shows '%s'\n" "$FILE" "$CURL"
    else
        printf "[$(tput setaf 2)INFO$(tput sgr0)] File is '%s' while curl shows '%s'\n" "$FILE" "$CURL"
    fi
    # sleep $[ ( $RANDOM % 3 )  + 1 ]s
    sleep 2
done
