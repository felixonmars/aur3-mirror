#!/bin/bash -e
. /etc/makepkg.archdroid

# XXX: we assume, that dependency checks are done while
# we are still in package directory
if [[ -f PKGBUILD ]]; then 
 source ./PKGBUILD;
fi

PACMAN_ARGS=("$@")

MAKEDEPENDS=("${makedepends[@]}")

shift
PACKAGES="$*"
PACKAGES=${PACKAGES/ --noconfirm/}
PACKAGES=${PACKAGES/ --noprogressbar/}

if [ ${#MAKEDEPENDS[*]} -ne 0 ] && [ "${PACMAN_ARGS[0]}" == "-T" ] && [ "${MAKEDEPENDS[*]}" == "${PACKAGES}" ]; then
  set +E
  ret=0
  pmout=$(pacman -T ${PACKAGES}) || ret=$?
  set -E
  if (( ret == 127 )) && [ -n "$pmout" ]; then #unresolved deps
    reset -IQw
    printf -v cmd "%q " "$PACMAN_orig" -S $pmout --needed --asdeps
    eval "su root -c '$cmd'"
  fi
else
  shopt -s extglob
  if [[ "${PACMAN_ARGS[0]}" == -[SRU]* ]];  then
    PACMAN_ARGS=(--noscriptlet ${PACMAN_ARGS[@]})
  fi
  shopt -u extglob

  pacman --config /etc/pacman.archdroid \
        --cachedir /fhs/var/cache/pacman/pkg/ \
        --logfile /fhs/var/log/pacman.log \
        --arch $CARCH ${PACMAN_ARGS[*]}
fi
