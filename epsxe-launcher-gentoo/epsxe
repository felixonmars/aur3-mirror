#!/bin/sh

PSEMUDIR="/opt/epsxe"
EPSXEDIR="/opt/epsxe"

mkdir -p ~/.epsxe
cd ~/.epsxe
#cleanlinks
mkdir -p memcards bios cfg cheats snap sstates patches plugins

shopt -s nullglob

for f in `find "${EPSXEDIR}" -maxdepth 1 -type f -printf '%f '` ; do
    [[ -e "${f}" ]] && continue
    ln -s "${EPSXEDIR}/${f}" "${f}" >& /dev/null
done

if [[ -d "${PSEMUDIR}" ]] ; then
    if [[ -d "${PSEMUDIR}/plugins" ]] ; then
        for plugin in `find "${PSEMUDIR}/plugins"  -maxdepth 1 -type f -printf '%f '` ; do
            if [[ ! -e "plugins/${plugin}" ]] ; then
                echo "Loading new plugin: ${plugin}"
                ln -s "${PSEMUDIR}/plugins/${plugin}" "plugins/${plugin}"
            fi
        done
    fi

    if [[ -d "${PSEMUDIR}/cfg" ]] ; then
        for configlib in `find "${PSEMUDIR}/cfg"  -maxdepth 1 -iname '*.cfg' -prune -o -type f -printf '%f '`; do 
            if [[ ! -e "cfg/${configlib}" ]] ; then
                echo "Loading config utility: ${configlib}"
                ln -s "${PSEMUDIR}/cfg/${configlib}" "cfg/${configlib}"
            fi
        done

        for config in `find "${PSEMUDIR}/cfg"  -maxdepth 1 -iname '*.cfg' -type f -printf '%f '`; do 
            if [[ ! -e "cfg/${config}" ]] ; then
                echo "Loading default config: ${config}"
                cp "${PSEMUDIR}/cfg/${config}" "cfg/${config}"
            fi
        done
    fi

    if [[ -d "${PSEMUDIR}/cheats" ]] ; then
        for cheat in `find "${PSEMUDIR}/cheats"  -maxdepth 1 -type f -printf '%f '`; do 
            if [[ ! -e "cheats/${cheat}" ]] ; then 
                ln -s "${PSEMUDIR}/cheats/${cheat}" "cheats/${cheat}"
            fi
        done
    fi

    if [[ -d "${PSEMUDIR}/bios" ]] ; then
        for bios in `find "${PSEMUDIR}/bios"  -maxdepth 1 -type f -printf '%f '`; do
            if [[ ! -e "bios/${bios}" ]] ; then
                ln -s "${PSEMUDIR}/bios/${bios}" "bios/${bios}"
            fi
        done
    fi
fi

# check for bios
if [[ -z "`cd bios && ls`" ]] ; then
    # if the bios directory is empty, then ... well ...
    echo
    echo "*** Put your BIOS file into ~/.epsxe/bios/"
    echo "    or ePSXe may not work!"
    echo
fi

# execute program (with args)
export LD_PRELOAD="libpthread.so.0:${LD_PRELOAD}" # fix for Bug #26121

case "$1" in
    ("-old")
        shift
        exec ./epsxe-152 "$@"
        ;;
    (*)
        exec ./epsxe "$@"
        ;;
esac

