#!/bin/bash
exe=`dmenu_path | dmenu -p 'Execute:' -nb '#000000' -nf '#FFFFFF' -sb '#FFFFFF' -sf '#000000'` && eval "exec $exe"
