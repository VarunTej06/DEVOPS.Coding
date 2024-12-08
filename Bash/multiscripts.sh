#!/bin/bash

# Script 1: Log Rotation Script: Write a script to rotate log files to prevent them from growing too large

function log_rotation {
    echo "executing script 1"
    log_file="/path/to/logfile.log"
    max_size=1000000 # 1MB
    if [ $(wc -c < "$log_file") -gt $max_size ]; then
        mv "$log_file" "$log_file.old"
        touch "$log_file"
    fi
}
# since function is getting called in the main section of this file no need to call dyna,ically from CLI with ./ command.

# Script 2: System Monitoring Script: Develop a script to monitor system resource (CPU and RAM) usage and send alerts if thresholds are exceeded.

function cpu_mem_monitor {
    echo "executing script 2"
    cpu_threshold=90
    mem_threshold=90
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    if (( $(echo "$cpu_usage > $cpu_threshold" | bc -l) )) || (( $(echo "$mem_usage > $mem_threshold" | bc -l) )); then
        echo "High CPU or memory usage detected!"
        # Send alert here
    fi
}
# since function is getting called in the main section of this file no need to call dyna,ically from CLI with ./ command.


# Script 3: Database Backup Script: Write a script to backup a database and compress the backup file.

function db_backup {
    echo "executing script 3"
    db_user="username"
    db_pass="password"
    db_name="database_name"
    backup_dir="/path/to/backup"
    timestamp=$(date +"%Y%m%d%H%M%S")
    mysqldump -u "$db_user" -p"$db_pass" "$db_name" | gzip > "$backup_dir/db_backup_$timestamp.sql.gz"
}
# since function is getting called in the main section of this file no need to call dyna,ically from CLI with ./ command.

# Script 4: File Transfer Script: Develop a script to transfer files securely between servers using SCP or SFTP.

function file_transfer {
    echo "executing script 4"
    source_file="/path/to/source/file"
    destination_server="user@hostname:/path/to/destination/"
    scp "$source_file" "$destination_server"
}
# since function is getting called in the main section of this file no need to call dyna,ically from CLI with ./ command.


# Call the functions based on the desired sequence
log_rotation
cpu_mem_monitor
db_backup
file_transfer