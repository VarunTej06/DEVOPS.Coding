#!/bin/bash

# Check if Docker service is running, if not then restart the service
service="docker"

if systemctl is-active --quiet $service; then
    echo "Docker service is running."
else
    echo "$service service is not running. Restarting the service..."
    sudo systemctl restart docker
    echo "Docker service has been restarted."
fi

# if systemctl is-active --quiet docker: This is valid and doesn't require square brackets 
# because systemctl is-active returns a status code that can be directly used in the if condition. 
# The command succeeds (returns 0) if Docker is running and fails (returns a non-zero value) if it's not.
# sNo need for square brackets ([]) when the condition is simply checking the exit status of a command.
