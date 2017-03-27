#!/bin/bash
user=$1
pwd_filepath=$2
target_hosts_filepath=$3

if [[ -z "$1" || -z "$2" || -z "$3" ]]; then
	echo "Usage: copy-ssh-keys [ad-user] [password-file-path] [target-hosts-file-path]"
	exit 0
else
	while read host; do
		sshpass -f $pwd_filepath ssh-copy-id -o StrictHostKeyChecking=no $user@$host;
	done <$target_hosts_filepath
fi