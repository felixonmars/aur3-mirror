#!/bin/bash

# con - Simple ssh connection manager.
# Copyright (c) 2010, Errol Byrd <errolbyrd@gmail.com>

_VER="0.3-3"

# Configuration
HOST_FILE="$HOME/.con_tool_hosts"
SSH_ARGS="-X"
SSH_PORT=22

# File specification
# alias,127.0.0.1,22,username
DATA_DELIM=","
DATA_ALIAS=1
DATA_HADDR=2
DATA_HPORT=3
DATA_HUSER=4

function probe ()
{
	als=$1
	if [ "$als" == "" ]; then return 1; fi
	grep -w -e $als $HOST_FILE > /dev/null
	return $?
}

function get_raw ()
{
	als=$1
	grep -w -e $als $HOST_FILE 2> /dev/null
}

function get_addr ()
{
	als=$1
	get_raw "$als" | awk -F "$DATA_DELIM" '{ print $'$DATA_HADDR' }'
}

function get_port ()
{
	als=$1
	get_raw "$als" | awk -F "$DATA_DELIM" '{ print $'$DATA_HPORT'}'
}

function get_user ()
{
	als=$1
	get_raw "$als" | awk -F "$DATA_DELIM" '{ print $'$DATA_HUSER' }'
}

p=$(basename $0)
cmd=$1
alias=$2
user=$3

if [ ! -f $HOST_FILE ]; then touch "$HOST_FILE"; fi
if [ $# -eq 0 ]; then 
	echo -e "$p v$_VER\nUsage:\n$p [cc] <alias> [username]\n$p add <alias> <address>,[port],<username>\n$p del <alias>\n\nAliases for currect user '$(whoami)':"
	cat $HOST_FILE;
	exit 0;
fi

case "$cmd" in

# Connect to host
	cc )
		probe "$alias"
		if [ $? -eq 0 ]; then
			if [ "$user" == ""  ]; then
				user=$(get_user "$alias")
			fi

			addr=$(get_addr "$alias")
			port=$(get_port "$alias")
		
			# Use default port when parameter is missing
			if [ "$port" == "" ]; then
				port=$SSH_PORT
			fi

			echo "Connecting to '$alias' ($addr:$port):"
			ssh $SSH_ARGS $user@$addr -p $port
		else
			echo "$p: Unknown alias '$alias'."
		fi
		;;

# Add new alias
	add )
		probe "$alias"
		if [ $? -eq 0 ]; then
			echo "$p: Alias '$alias' is already in use."
		else
			echo "$alias$DATA_DELIM$user" >> $HOST_FILE
			echo "New alias '$alias' added."
		fi
		;;
# Delete alias
	del )
		probe "$alias"
		if [ $? -eq 0 ]; then
			cat $HOST_FILE | sed '/^'$alias$DATA_DELIM'/d' > /tmp/.con.$$
			mv /tmp/.con.$$ $HOST_FILE
			echo "Alias '$alias' removed."
		else
			echo "$p: Unknown alias '$alias'."
		fi
		;;

	* )
		#echo "$p: Unrecognized command '$cmd'."
		user="$alias"; alias="$cmd"; cmd="cc";
		$0 $cmd $alias $user 
		;;
esac	

