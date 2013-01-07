#!/bin/bash

build() {
	add_binary /usr/lib/suspend/resume
	add_file /etc/suspend.conf
	add_runscript
}

help() {
	cat<<HELPEOF
  This hook initializes support for resuming from Disk.
  Supports uswsusp with Fbsplash.
HELPEOF
}

# vim:set ft=sh:
