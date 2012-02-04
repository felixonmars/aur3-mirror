#!/bin/sh

post_install() {
	# The date below is automatically replaced by the PKGBUILD.
	_pkgdate='{year=2009, month=01, day=10}'
	# We check if the package is possibly outdated.
	_pkgold=`lua -e "pkgdate=os.time($_pkgdate);
	print(os.time() >= (pkgdate + 28*24*3600));"`
	if [ "$_pkgold" = "true" ]; then
		cat << EOF
PLEASE NOTE:
------------------------------------------------------------------------
This package is older than 28 days, so it may not be the latest version
of Ion-3. The author does not support old and/or obsoleted versions.
Please send any bug reports to the package maintainer, not the author.
------------------------------------------------------------------------
Please read the message above and press ENTER to continue...
EOF
		read
	fi
}

post_upgrade() {
	post_install
}

op=$1
shift
[ "$(type -t "$op")" = "function" ] && $op "$@"
