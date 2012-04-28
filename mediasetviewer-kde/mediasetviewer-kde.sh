#!/bin/bash

check_deps() {
    [ -x /usr/bin/curl ] || exit 1
    [ -x /usr/bin/vlc ] || exit 1
    [ -x /usr/bin/knotify4 ] || exit 1
}

main() {
    url=$(kdialog --title="Mediaset Stream" --inputbox="Page url:")

    [ ${#url} -eq 0 ] && exit 1

    videoid=$(curl "${url}" | grep jsonVideoMetadata | grep -o '"id":[^,]*' | awk -F '"' '{print $4}')

    streams=$(curl "http://cdnselector.xuniplay.fdnames.com/GetCDN.aspx?streamid=${videoid}" | grep -o 'video src=[^>]*' | awk -F '"' '{print $2}' | grep -v .ism)

    [ ${#streams} -eq 0 ] && exit 1

    cmd="kdialog --title=\"Mediaset_Stream\" --menu \"Choose_one:\" --"

    for s in ${streams}; do
      cmd="${cmd} ${s} ${s}"
    done

    stream=$(${cmd})

    [ ${#stream} -eq 0 ] && exit 1

    vlc "${stream}"
}

check_deps

main $@

exit 0
