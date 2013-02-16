#!/bin/bash

VERSION="1.0"

###################################
### OPTIONS                     ###
###################################

VERBOSE=0
QUIET=0
TIMEOUT_WAIT=30
ADDR_WAIT=""
METHOD_WAIT="ping"

###################################
### General functions           ###
###################################

# -ab --long -> -a -b --long
# set $OPTS
explode_args() {
    unset OPTS
    local arg=$1
    while [[ $arg ]]; do
        [[ $arg = "--" ]] && OPTS+=("$@") && break;
        if [[ ${arg:0:1} = "-" && ${arg:1:1} != "-" ]]; then
            OPTS+=("-${arg:1:1}")
            (( ${#arg} > 2 )) && arg="-${arg:2}" || { shift; arg=$1; }
        else
            OPTS+=("$arg"); shift; arg=$1
        fi
    done
}

usage() {
cat << EOF
usage: $0 [options] address

This is a utility to find out whether we are online.
It is done by pinging or checking that the address passed to this script can be accessed.
Waits until the specified address can be accessed, or that the specified timeout expires.
On exit, the returned status code should be checked. 

OPTIONS:
   -h, --help      Show this message
   -q, --quiet     Do not show any message
   -v, --verbose   Display every error message
   -m, --method    Select the method to wait on the specified address: "ping" or "route"
   -t, --timeout   Set the maximum time to wait in second
   -V, --version   Display the version

ADDRESS:  An IP address in case of routing, for ping can be a domain...
EOF
}

version() {
    echo "network-wait-online $VERSION"
}

###################################
### Argument parsing            ###
###################################

# Explode arguments
explode_args "$@"
set -- "${OPTS[@]}"
unset OPTS

while [[ $1 ]]; do
    case "$1" in
        -h|--help)          usage; exit 0;;
        -q|--quiet)         QUIET=1; VERBOSE=0;;
        -v|--verbose)       QUIET=0; VERBOSE=1;;
        -m|--method)        shift; METHOD_WAIT="$1";;
        -t|--timeout)       shift; TIMEOUT_WAIT="$1";;
        -V|--version)       version; exit 0;;
        *)                  if [ -z "$ADDR_WAIT" ] ; then ADDR_WAIT="$1"; else usage; exit 10; fi ;;
    esac
    shift
done

# Check that the address is specified
if [ -z "$ADDR_WAIT" ] ; then
    usage
    exit 10
fi

###################################
### Wait functions              ###
###################################

wait_addr_ping() {

    local retCode=12
    local timeEnd=$(( $(date +%s) + TIMEOUT_WAIT ))
    local timeLeft=$TIMEOUT_WAIT

    while [ $timeLeft -gt 0 ] ; do

        ping -c1 -W1 $ADDR_WAIT
        retCode=$?
        if [ $retCode -eq 0 ] ; then
            break
        else
            sleep 0.3
            timeLeft=$(( timeEnd - $(date +%s) ))
        fi

    done
    return $retCode
}

wait_addr_route() {

    local retCode=13
    local nbStepLeft=$(( TIMEOUT_WAIT * 3 ))

    while [ $nbStepLeft -gt 0 ] ; do

        ip route get $ADDR_WAIT
        retCode=$?
        if [ $retCode -eq 0 ] ; then
            break
        else
            sleep 0.33
            nbStepLeft=$(( nbStepLeft - 1 ))
        fi

    done
    return $retCode
}

###################################
### Program                     ###
###################################

retCode=11

if [ "$METHOD_WAIT" == "ping" ] ; then

    if [ $VERBOSE -eq 1 ] ; then
        wait_addr_ping
    else
        wait_addr_ping &>/dev/null
    fi
    retCode=$?

elif [ "$METHOD_WAIT" == "route" ] ; then

    if [ $VERBOSE -eq 1 ] ; then
        wait_addr_route
    else
        wait_addr_route &>/dev/null
    fi
    retCode=$?

else
    usage
    exit 10
fi

# Display result if not quiet
if [ $QUIET -eq 0 ]; then
    [ $retCode -ne 0 ] && echo "Failed $METHOD_WAIT $ADDR_WAIT" 1>&2
    [ $retCode -eq 0 ] && echo "Successfully $METHOD_WAIT $ADDR_WAIT"
fi

exit $retCode
