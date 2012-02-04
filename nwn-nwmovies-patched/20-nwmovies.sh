nwn.helpers.nwmovies() {
  if [ -f "nwmovies.ini" ]; then
    local realSize=$(stat --printf="%s" "nwmain")
    local realTime=$(stat --printf="%Y" "nwmain")
    local savedSize=$(sed -n -r -e 's/^size ([0-9]+)$/\1/p' "nwmovies.ini")
    local savedTime=$(sed -n -r -e 's/^time ([0-9]+)$/\1/p' "nwmovies.ini")
    if [ "x$realSize" != "x$savedSize" ] || [ "x$realTime" != "x$savedTime" ]; then
      LD_PRELOAD="./nwmovies/nwmovies.so:${LD_PRELOAD}" ./nwn
    fi
  else
    LD_PRELOAD="./nwmovies/nwmovies.so:${LD_PRELOAD}" ./nwn
  fi
  LD_PRELOAD="./nwmovies/nwmovies.so:${LD_PRELOAD}" "${@}"
}

nwn.hooks.nwn.20-nwmovies() {
  nwn.helpers.nwmovies "${@}"
}

nwn.hooks.dmclient.20-nwmovies() {
  nwn.helpers.nwmovies "${@}"
}
