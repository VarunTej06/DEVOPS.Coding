#!/bin/bash

#################################
###### Description: Monitor Disk usage and send an alert if usage exceeds defined threshold
###### Version: V1
###### Author: Varun
################################

threshold=80

usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
# df / means disk that is mounted at /. print $5 means fifth column from df /
# replace / with any other mounting point. check by giving df -h command and then modify the usage variable value

if [ $usage -gt $threshold ]; then
echo "Disk usage is $usage%, sending alert"
# uncomment below line to send email alert but requires email setup
# echo "Disk usage alert $usage" | mail -s "Disk usage warning" varuntej1045@gmail.com
# string inside echo is the body of the email. -s will be passed as subjetc of the email. 
fi