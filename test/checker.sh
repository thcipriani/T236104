#!/usr/bin/env bash
DEPLOY_DONE=0
while :; do
    CURL=$(curl -s 'http://localhost:8080/test.php' &)
    FILE=$(awk '/foo/ {print $3}' src/InitialiseSettings.php | tr -d ';')

    wait

    if [[ "$FILE" != "$CURL" ]]; then
        # Once we get a bad deploy, we want to stop deploying as we want to see if the situation is transient or not.
        DEPLOY_DONE=1
        printf "[$(tput setaf 1)ERROR$(tput sgr0)] File is '%s' while curl shows '%s'\n" "$FILE" "$CURL"
    else
        printf "[$(tput setaf 2)INFO$(tput sgr0)] File is '%s' while curl shows '%s'\n" "$FILE" "$CURL"
    fi
    # We deploy ONE new version at a random time between t=2 and t=20
    sleep 2
    if [ "$DEPLOY_DONE" -eq 0 ]; then
        echo "Deploying a new version!"
        NEW_NUMBER=$(( $RANDOM % 100 ))
        sed -i "s/[0-9]*;/${NEW_NUMBER};/" "src/InitialiseSettings.php"
        echo "Deployed value: ${NEW_NUMBER}"
    fi;
done
