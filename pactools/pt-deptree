#!/bin/sh
# Pacman Dependency Tree
# does NOT handle group names -> unexpected results.
# Package names using aliases, like x-server, should work.
# Breaks on circular dependencies -> you better hit ctrl-c.

export LC_ALL=en_US

progname=`basename $0`
pacexec='pacman'
leafnull='None'
branch=""
vbranch="|   "
vprune="    "
hbranch="+---"

_showdep () {

    # Try to use specific pkg req
    if $pacexec -Qi $1 &> /dev/null ; then
         # Grab deps list|from "Depends"|Remove Tag \| specific version req's.
        deplist=`$pacexec -Qi $1|grep Depends|sed 's/^.*: \|>[^ ]*//g;s/ $//'`
    else # Oops! Failed on alias, try this...
        deplist=`$pacexec -Qs $1 | sed '1!d;s/\(^.*\/\)\(.*\)\( .*$\)/\2/'`
    fi

    [ "x$deplist" = "x$leafnull" ] && return

    while [ -n "$deplist" ]
    do
        set -- $deplist && echo "$branch$hbranch$1"
        if [ $# -gt 1 ] ; then
            branch=${branch}$vbranch
        else
            branch=${branch}$vprune
        fi

        _showdep $1

        deplist=${*:2}
        branch=${branch:0:${#branch}-${#vprune}}
    done
}

branch=$vprune

for pkg in `$pacexec -Q $1 | sed 's/ .*//'`
do
    echo $pkg
    _showdep $pkg
done

unset _showdep && set --
exit 0 
