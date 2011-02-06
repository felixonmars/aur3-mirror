#!/bin/bash
grep -q w83627hf /etc/modprobe.conf
if [ $? -ne 0 ]; then
	echo w83627hf >> /etc/modprobe.conf
fi

