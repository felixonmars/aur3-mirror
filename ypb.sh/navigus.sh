### why the heck something like this in not on by default? ###

# avigu.sh help
function N_avigush_help() {
	echo "#
# [h | help]
# [l | list]            : list dirs
#
# [s | switch] [args]   : push current, then 'cd args'
# [g | go] <num>        : go to <num> directory from list
# [n | navigate] <num>  : push current, then 'N g <num>'
#                         better be in range with that <num>
# [e | erase] <num>     : remove <num>th dir from list
# [c | clear]           : clear current list completely
#
# [d | dump] [file]     : dump dirs to <file> or ~/.avigush
# [r | restore] [file]  : restore from <file> or ~/.avigush
#"
}

# list dirs
function N_avigush_list() {
	dirs -l -p -v | egrep -v "^.*0[[:blank:]]+/"
}

# switch to dir saving current
function N_avigush_switch() {
	pushd . > /dev/null ; cd "$@" ;
}

# go to Nth dir in stack
function N_avigush_go() {
	# Zsh knows not the 'dirs +/-N' but 'cd +/-N'
	cd $(N l | egrep "^.*$1[[:blank:]]+/" | sed 's|^[^/]*||')
}

# go to Nth while pushing current for later... n as in navigate
function N_avigush_navigate() {
	pushd . > /dev/null ; N g $(($1+1)) ;
}

# erase Nth
function N_avigush_erase() {
	popd +$1 > /dev/null
}

# clear
function N_avigush_clear() {
	dirs -c
}

# save to default or some file
function N_avigush_dump() {
	local FILE=${1:-$HOME/.avigush}
	echo "# dump($FILE)" ;
	N l | sort -rg |
	sed 's,^[^/]*,,g' 2>/dev/null > "$FILE" &&
	echo "# taken" ||
	echo "# doops" ;
}

# restore from file, bash sucks monkey ballz... forealz!
function N_avigush_restore() {
	local CWD=$(pwd)
	local FILE=${1:-$HOME/.avigush}
	[ -r "$FILE" ] || {
		echo "# file($FILE) not readable" ; return ;
	}
	echo "# load($FILE)" ;
	IFS=$'\n' ; for d in `cat $FILE` ; do
#		echo "-$d-" ;
		[ -d "$d" ] &&
		cd "$d" &&
		pushd . > /dev/null ;
	done &&	echo "# done" ||
	echo "# oops" ;
	cd $CWD ;
}

function N() {
	case "$1" in
		h|help) N_avigush_help ;;
		l|list) N_avigush_list ;;
		s|switch) shift ; N_avigush_switch "$@" ;;
		g|go) shift ; N_avigush_go "$@" ;;
		n|navigate) shift ; N_avigush_navigate "$@" ;;
		e|erase) shift ; N_avigush_erase "$@" ;;
		c|clear) N_avigush_clear ;;
		d|dump) shift ; N_avigush_dump "$@" ;;
		r|restore) shift ; N_avigush_restore "$@" ;;
		*) N_avigush_help ;;
	esac
}

# BIGFATNOTE: unlimited number of dirs regex might cut smth off.
