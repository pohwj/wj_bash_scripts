#!/bin/bash
# Script to cycle through the applications in an organisation to check if they use java_buildpack_appd447 in PCF. Organisation is to be entered accordingly.

api=<#your api>
id=$1
pw=$2
org=<#your organisation>
cf login -a "$api" -u "$id" -p "$pw" -o "$org"
spaces=$(cf spaces | tail -n+4)
echo $spaces
echo
for space in $spaces 
do
    space_enter=$(cf target -s "$space")
    app_names=$(cf apps | tail -n+4 | awk '{print $1}')
    for app in $app_names; do
        app_info=$(cf app "$app")
            if echo $app_info | grep -q "java_buildpack_appd447";then
                echo "$app_name in $space uses the java_buildpack_appd447."
            else
                echo "$app in $space is clear"
            fi
    done
    echo
done