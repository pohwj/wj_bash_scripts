# The shell script serves to check if an employee from a group is still present in the company

#/bin/bash

function check_access(){
    local org="$1"
    shift
    local team=("$@")

    for person in ${team[@]}
    do
        url="$base_url/$person"
        reponse=$(curl -k -s "$url")
        echo $response | grep -qi "MY DEPARTMENT"
        if [ $? -ne 0 ]; then
            
            echo "$person is no longer in the company"

        else
            continue
        fi
    done
}

T1=("alice" "ben" "charlie")

T2=("david" "edward" "frank")

T3=("george" "harry" "ian")

base_url="https://active_directory.example.com/empDetails"

check_access "T1" "${T1[@]}"
check_access "T2" "${T2[@]}"
check_access "T3" "${T3[@]}"