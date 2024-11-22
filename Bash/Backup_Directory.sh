#!/bin/bash

#################################
###### Description: Script to backup a directory eg /var/log to another location, compress it and add a timestamp to the filename
###### Version: V1
###### Author: Varun
################################

src_dir="/var/log"

backup_dir="/backup/logs"

filename="log_backup_$(date +'%Y%m%d_%H%M%S').tar.gz"

# ensure backup directly is created if not existed. If directory is there -p flag will take care and doesn't create again
mkdir -p "$backup_dir"

# This command creates a compressed (-z), tarball (-c) from the contents of $src_dir and saves it to $backup_dir with the timestamped filename.
tar -czf $backup_dir/$filename $src_dir

echo "Backcompleted: $filename"

# If executed as root user then it will work. 
# If executed as user - It will fail. 
# To work for Super user