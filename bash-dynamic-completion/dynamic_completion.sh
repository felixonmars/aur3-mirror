#! /bin/sh

#	This script automatically moves the completion
#	functions from /etc/bash_completion and /etc/bash_completion.d 
#	to a separate directory and creates a drop-in replacement for 
#	/etc/bash_completion - which will load any of those completion
#	functions when it is requested for the first time. By this, we
#	greatly reduce the loading time (the replacement script is ~30kb)
#	and also the memory footprint (as we rarely need every completion 
#	function in every bash session).
#
#	The generator script is intended to be run once the base script
#	/etc/bash_completion is installed and then, every time something 
#	is added to /etc/bash_completion.d. I'd like to propose it for
#	the bash package -- maybe as an optional part of installation.
#
#	Taken from http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=467231
#	Author: Andrei Paskevich
#		andrei@capet.iut-fbleau.fr

BASH_COMPLETION=/etc/bash_completion
BASH_DYNCOMPLETION=/etc/bash_dyncompletion
BASH_DYNCOMPLETION_DIR=/etc/bash_dyncompletion.d

echo "Read static completions from $BASH_COMPLETION"
. "$BASH_COMPLETION" || exit 1

echo "Create dynamic completion file $BASH_DYNCOMPLETION"
touch "$BASH_DYNCOMPLETION" || exit 1

echo "Create dynamic completion directory $BASH_DYNCOMPLETION_DIR"
mkdir -p "$BASH_DYNCOMPLETION_DIR" || exit 1

echo -n "Populate dynamic completion directory:"
FUNCS=$(declare -f | grep '^[a-zA-Z_][a-zA-Z0-9_]* () $' | cut -f 1 -d ' ')
for FN in $FUNCS ; do
    echo -n " $FN"
    declare -f $FN > "$BASH_DYNCOMPLETION_DIR/$FN"
    eval "$FN () { . '$BASH_DYNCOMPLETION_DIR/$FN' ; $FN \"\$@\" ; }"
done
echo

echo "Write dynamic completion file $BASH_DYNCOMPLETION"
exec > "$BASH_DYNCOMPLETION"
cat <<EOF
# $(basename $BASH_DYNCOMPLETION) - load-by-need bash completions
# actual completion functions are stored in $BASH_DYNCOMPLETION_DIR
# this file and directory are generated from $BASH_COMPLETION

shopt -s extglob progcomp
EOF

declare -p BASH_COMPLETION 2>/dev/null
declare -p bash205 2>/dev/null
declare -p bash205b 2>/dev/null
declare -p bash3 2>/dev/null
declare -f
complete -p

exit 0
