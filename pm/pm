#!/bin/bash
# References for common Arch Linux package management tasks

# Required program(s)
req_progs=(pacaur)
for p in ${req_progs[@]}; do
  hash "$p" 2>&- || \
  { echo >&2 " Required program \"$p\" not installed."; exit 1; }
done

# Display usage if no parameters given
if [[ -z $@ ]]; then
  echo " ${0##*/} <option> <*package> - pacman management tasks:
   1 | oneshot  - install package(s) as a dependency
   d | depclean - remove dependencies no longer used
   e | explicit - force package to be recognized as necessary
   f | forcerem - force remove package            (no dependency check)
   i | install  - install a package
   l | list     - list files installed by the package
   n | info     - information about the package
   o | owns     - package that owns a file
   p | local    - install package locally         (a pkg.tar.gz file)
   q | query    - query for an installed package  (Q for details)
   r | remove   - remove a package
   s | search   - search for a package            (S for details)
   u | upgrade  - sync database and upgrade system
   y | sync     - sync database
   ---
   clean        - cleans package cache of packages no longer installed
   optimize     - optimize database by placing files in order on disk
   pkglist      - create list of official and local installed packages"
   exit
fi

case $1 in
  1 | oneshot  )  shift
                  if [[ "${1#*.pkg.}" == tar.xz ]]; then
                    sudo pacman -U --asdeps "$@"
                  else
                    pacaur -S --asdeps "$@"
                  fi                                                          ;;
  d | depclean )  sudo pacman -Rs $(pacaur -Qtdq)                             ;;
  e | explicit )  shift
                  sudo pacman -S --asexplicit "$@"                            ;;
  f | forcerem )  shift
                  sudo pacman -Rcd "$@"                                       ;;
  i | install  )  shift
                  pacaur -S "$@"                                              ;;
  l | list     )  shift
                  pacman -Qql "$@"                                            ;;
  n | info     )  shift
                  for pkg in "$@"; do
                    pacaur -Si $pkg
                  done                                                        ;;
  o | own      )  shift
                  pacman -Qo "$@"                                             ;;
  p | local    )  shift
                  sudo pacman -U "$@"                                         ;;
  q | query    )  shift
                  pacman -Qqs  "$@"                                           ;;
  Q | Query    )  shift
                  pacman -Qs  "$@"                                            ;;
  r | remove   )  shift
                  # http://tinyurl.com/pacman-Rcs
                  # sudo pacman -Rs "$@"
                  sudo pacman -Rcs "$@"                                       ;;
  s | search   )  shift
                  pacaur -Ss "$@" | sed '/^    .*$/d' | cut -d " " -f 1       ;;
  S | Search   )  shift
                  pacaur -Ss "$@"                                             ;;
  u | upgrade  )  pacaur -Syu                                                 ;;
  U | Upgrade  )  pacaur -Syu --devel                                         ;;
  y | sync     )  shift
                  sudo pacman -Syy                                            ;;
  # ---
  c | clean    )  sudo pacman -Sc                                             ;;
  optimize     )  sudo pacman-optimize                                        ;;
  pkglist      )  date="$(date "+%F")"
                  pacman -Qqe | grep -v "$(pacman -Qqm)" > pkglist-off-$date.txt
                  pacman -Qqm >                            pkglist-loc-$date.txt
                  ;;
  *            )  sudo pacman "$@"
esac
