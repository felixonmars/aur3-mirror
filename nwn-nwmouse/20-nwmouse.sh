nwn.helpers.nwmouse() {
  if [ -f "nwmouse.ini" ]; then
    local realSize=$(stat --printf="%s" "nwmain")
    local realTime=$(stat --printf="%Y" "nwmain")
    local savedSize=$(sed -n -r -e 's/^size ([0-9]+)$/\1/p' "nwmouse.ini")
    local savedTime=$(sed -n -r -e 's/^time ([0-9]+)$/\1/p' "nwmouse.ini")
    if [ "x$realSize" != "x$savedSize" ] || [ "x$realTime" != "x$savedTime" ]; then
      LD_PRELOAD="./nwmouse/nwmouse.so:${LD_PRELOAD}" ./nwn
    fi
  else
    LD_PRELOAD="./nwmouse/nwmouse.so:${LD_PRELOAD}" ./nwn
  fi
  XCURSOR_PATH="$PWD" XCURSOR_THEME="nwmouse" LD_PRELOAD="./nwmouse/nwmouse.so:${LD_PRELOAD}" "${@}"
}

nwn.hooks.nwn.20-nwmouse() {
  nwn.helpers.nwmouse "${@}"
}

nwn.hooks.dmclient.20-nwmouse() {
  nwn.helpers.nwmouse "${@}"
}
