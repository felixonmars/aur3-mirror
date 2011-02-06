#!/bin/bash

VERSION="0.1"

print_help() {
printf "\e[1mfestival-pl\e[0m (konwerter czcionek) - wersja \e[1m%s\e[0m (c) \e[1m3ED 2009\e[0m GPL3

\e[1mUżycie:\e[0m festival-pl -h|--help|--pomoc
        festival-pl \"Wpisz tutaj swój tekst\"

\e[1mFESTIVAL:\e[0m
\e[1m1.\e[0m Aby ustawić polski głos jako domyślny:
     \e[1ma)\e[0m edytuj plik: /usr/share/festival/voices.scm
     \e[1mb)\e[0m wyszukaj linijkę: defvar default-voice-priority-list
     \e[1mc)\e[0m do listy dopisz: cstr_pl_em_diphone
\e[1m2.\e[0m Aby korzystać z festival bez użycia tego front-endu, pamiętaj że
   Festival (albo polski głos) nie obsługuje poslkich czcionek.. Spis:
     ą - o~ - oun
     ć - c~ - tsi
     ę - e~ - eun
     ł - l/ - eu
     ń - n~ - eni
     ś - s~ - esi
     ź - z~ - ziet
     ż - z* - rzet
     ó - u  - u

\e[1mMoja uwaga:\e[0m Głos cstr_pl_em_diphone nie jest najwyższych lotów ale nie
            znam alternatywy.. :( Jest on wydany jako darmowy w zastoso-
            waniu niekomercyjnym, program \e[4mfestival-pl\e[0m jest wydany jako
            program wolnego/otwartego oprogramowania na licencji GPL3.

\e[1mWięcej na temat cstr_pl_em_diphone znajdziesz tutaj:\e[0m
  /usr/share/festival/voices/polish/cstr_pl_em_diphone/README
  /usr/share/festival/voices/polish/cstr_pl_em_diphone/przeczytajto.txt
" "$VERSION"
}

case $1 in
	-h|--help|--pomoc) print_help;;
	*) echo "$@" | sed '
s|ó|u|g
s|ą|o~|g
s|ć|c~|g
s|ę|e~|g
s|ł|l/|g
s|ń|n~|g
s|ś|s~|g
s|ź|z~|g
s|ż|z*|g
' | festival --tts
esac
