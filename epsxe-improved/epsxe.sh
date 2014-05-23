#!/bin/bash

usage() {
    cat << END_USAGE
usage: $0 [-n]

OPTIONS:
    -h  Show this message
    -n  Does not start ePSXe (no-execute)
    -g  Generates the default configuration file
END_USAGE
}

NO_EXECUTE=
GENERATE_CONFIG=

while getopts ":hng" OPTION; do
    case $OPTION in
        h)
            usage
            exit 1
            ;;
        n)
            NO_EXECUTE=1
            ;;
        g)
            GENERATE_CONFIG=1
            ;;
        ?)
            usage
            exit
            ;;
    esac
done

OLD_DIR=${PWD}
RO_DIR='/opt/epsxe'
RW_DIR=${HOME}/.epsxe
TMP_DIR=$(mktemp -d)

echo 'Checking existence of .epsxe directory..'
if [[ ! -d "${RW_DIR}" ]]; then
    mkdir -v "${RW_DIR}"
    GENERATE_CONFIG=1
fi

echo 'Creating unionfs mount..'
unionfs -o uid=$(id -u) -o cow "${RW_DIR}"=RW:"${RO_DIR}"=RO "${TMP_DIR}"
cd "${TMP_DIR}"

if [[ ! -z "${GENERATE_CONFIG}" ]]; then
    cat << END_CONFIG > ./launcher.conf
WRAPPER=""
END_CONFIG
fi

source ./launcher.conf

echo 'Starting ePSXe..'
if [[ -z "${NO_EXECUTE}" ]]; then
    ${WRAPPER} ./epsxe $@
fi

echo 'Cleaning up..'
cd "${OLD_DIR}"
while [[ -e "${TMP_DIR}" ]]; do
    sleep 1;
    fusermount -u "${TMP_DIR}"
    rmdir -v "${TMP_DIR}"
done

echo 'Done.'
