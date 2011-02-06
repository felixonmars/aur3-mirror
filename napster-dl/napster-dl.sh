#!/bin/sh

usage() {
	cat <<- EOF
		Usage: $0 <OPTION>

		Options:
		  --cli         run in shell only
		  --help        show this help
	EOF
}

case "$1" in
	--help)
		usage
		exit 0
	;;

	--cli|"")
		:
	;;

	*)
		usage
		exit 1
esac

cd /usr/share/napster-dl
java -jar napster-dl.jar "$@"
