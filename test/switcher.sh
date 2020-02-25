#!/usr/bin/env bash
COUNT=${1:-0}


while :; do
    sed -i "s/[0-9]*;/${COUNT};/" "src/InitialiseSettings.php"
    printf 'Switching to %s\n' "$COUNT"
    (( COUNT++ ))
    # Twice in 1 second
    sed -i "s/[0-9]*;/${COUNT};/" "src/InitialiseSettings.php"
    printf 'Switching to %s\n' "$COUNT"
    (( COUNT++ ))
    sleep 5;
done
