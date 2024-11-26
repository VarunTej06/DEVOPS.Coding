#!/bin/bash

set -x
# function definition to be defined at the top of the file always

function launch_rocket() { 
# Can remove function word as well
# Commands to be executed
mission_name=$1
mkdir $mission_name
touch $mission_name/$mission_name.txt
}

# Call the function with arguments
launch_rocket lunar_mission