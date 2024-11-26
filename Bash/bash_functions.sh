#!/bin/bash

set -x

function launch_rocket() {

mission_name=$1

mkdir $mission_name
touch $mission_name/$mission_name.txt

}

launch_rocket lunar_mission