#!/bin/bash
#						  _     _  
#		  ___  _ __   ___ _ __   __ _  __| | __| |_   _ ___  ___ _ __
#		 / _ \| '_ \ / _ \ '_ \ / _` |/ _` |/ _` | | | / __|/ _ \ '__|
#    		| (_) | |_) |  __/ | | | (_| | (_| | (_| | |_| \__ \  __/ |
#		 \___/| .__/ \___|_| |_|\__,_|\__,_|\__,_|\__,_|___/\___|_|
#		      |_|
#
#
# NW
#
# "Works only if You suck really, really hard"
# (c) robmal
# thx ;-)
# (c) chori
# 	  
# Konrad "chori" Szymaszek
# mail: konradek26@gmail.com
# gg: 7438749
#
# Skrypt Openadduser sluzy do dodawania nowych uzytkownikow do systemu.
# Polecany szczegolnie administratorom serwerow shell.
#
# Skrypt jest w fazie rozwojowej, ale dziala poprawnie i nie uszkadza systemu.
# Serdeczne bog zaplac dla : Komornik, mith, robmal, klupek, Staszek, jceel, Partition. 

[ ! "`id -u`" = "0" ] && echo "Nie masz odpowiednich uprawnien by uruchomic ten skrypt." && exit;
pwgen_sc=$( which pwgen  > /dev/null 2>&1  )
[ ! -e $pwgen_sc ] && echo "Nie odnaleziono narzedzia pwgen w systemie. Konczenie pracy programu openadduser" && exit;

function backup
{ cp /etc/shadow /etc/shadow-openadduser; cp /etc/passwd /etc/passwd-openadduser; cp /etc/group /etc/group-openadduser; }
function ok
{ echo "Pomyslne! :-)"; }
function not_ok
{ echo "Nie odnaleziono."; echo "Konczenie pracy programu opeadduser"; echo; exit; }

clear

backup
echo;
echo "Tworzenie kopii zapasowych plikow shadow | passwd | group...";
echo "Kopie zapasowe znajduja sie w katalogu /etc i maja dodana do nazwy koncowke "-openadduser"";
echo;

echo "-----------------";
echo -e '\E[37;44m'"\033[1m   Openadduser   \033[0m"
echo "-----------------";
echo;

echo -ne "\033[1m[ Login ]: \033[0m"; read user
[ -z $user ] && user=$(pwgen -1 -n 8)
echo "$user" | grep "[^[:alnum:]$]" > /dev/null 2>&1 && echo "Wprowadzono bledna nazwe uzytkownika. Konczenie pracy programu openadduser" && exit;

echo -ne "\033[1m[ Komentarz ]: \033[0m"; read pre_comment
[ -z "$pre_comment" ] && pre_comment="Openadduser";
comment=$( echo $pre_comment | sed s/\ /./g )

echo -ne "\033[1m[ UID ( kolejny wolny ) ]: \033[0m"; read uid
echo "$uid" | grep '[^[:digit:]$]' > /dev/null 2>&1 && echo "Wprowadzono bledny uid. Konczenie pracy programu openadduser" && exit;
[ -z $uid ] && export liczba="1" && export temp=`tempfile` && awk -F: '{ print $3 }' /etc/passwd | grep -v '65534' |  sort -g > $temp && last_uid=$( sort -k3 -t: -n /etc/passwd | awk -F: '{if ($3 >= 1000 && $3 < 8000) print $3; }' | tail -n1 )
[ $last_uid -lt 1000 ] && export uid=$lastuid
[ $last_uid -ge 1000 ] && let uid=last_uid+liczba

echo -ne "\033[1m[ Grupa ( users ) ]: \033[0m"; read group
[ -z $group ] && export group="users"
echo "$group" | grep '[^[:alnum:]$]' > /dev/null 2>&1 && echo "Wprowadzono bledna nazwe grupy. Konczenie pracy programu openadduser" && exit;
echo -ne "\033[1m[ Shell ( /bin/bash ) ]: \033[0m"; read shell;

while [ ! -e $shell ]; do echo "Wprowadzona powloka nie istnieje." && echo -ne "\033[1m[ Shell ( /bin/bash ) ]: \033[0m" && read shell; done;
[ -z $shell ] && export shell="/bin/bash"

echo -ne "\033[1m[ Home ( /home/$user ) ]: \033[0m"; read home;
[ -z $home ] && export home="/home/$user"

echo -ne "\033[1m[ Dlugosc hasla ( 8 ) ]: \033[0m"; read ile;
[ -z $ile ] && export ile="8"
echo "$ile" | grep '[^[:digit:]$]' > /dev/null 2>&1 && echo "Wprowadzono bledna wartosc. Konczenie pracy programu openadduser" && exit;

clear;

echo "-----------------";
echo -e '\E[37;41m'"\033[1m  Podsumowanie  \033[0m"
echo "-----------------";
echo -ne "\033[1m[ Login ]....: \033[0m"; echo  "$user";
echo -ne "\033[1m[ Komentarz ]: \033[0m"; echo  "$comment"; 
echo -ne "\033[1m[ UID ]......: \033[0m"; echo  "$uid"; 
echo -ne "\033[1m[ Grupa ]....: \033[0m"; echo  "$group";
echo -ne "\033[1m[ Shell ]....: \033[0m"; echo  "$shell";
echo -ne "\033[1m[ Home ].....: \033[0m"; echo  "$home";
echo -ne "\033[1m[ Haslo ]....: \033[0m"; echo  "$ile znakow";
echo "--------------------------------------"; echo;
echo "Nacisnij enter aby kontynuowac, CTRL+C zeby anulowac dodawanie...";
read decision
[ -z  $decision ];

clear;

echo "Tworzenie uzytkownika $user";
useradd $user -m -d $home -s $shell -u $uid -c $comment
chmod 700 $home
cat /etc/group | grep -v $user:x: > /tmp/group; mv /tmp/group /etc/group;
[ `grep $group /etc/group` ] && echo "Grupa $group istnieje, tworzenie pominiete" && gpasswd -a $user $group || echo "Grupa $group nie istnieje, zostaje stworzona" && groupadd  $group && gpasswd -a $user $group
echo;

echo -e "\033[1m0. Generowanie $ile znakowego hasla dla uzytkownika $user\033[0m";
[ -n $ile ] && ok
file=`tempfile`
>$file
p=$(pwgen -1 -n $ile)
echo "$user:$p" >> $file
chpasswd < $file

echo;
echo -e "\033[1m1. Sprawdzanie istnienia katalogu domowego\033[0m";
[ -e $home ] && ok || not_ok

echo; 
echo -e "\033[1m2. Sprawdzanie istnienia wpisu w /etc/passwd\033[0m";
[ `grep $user /etc/passwd` ] && ok || not_ok 	

echo;
echo -e "\033[1m3. Sprawdzanie istnienia wpisu w /etc/shadow\033[0m";
[ `grep $user /etc/shadow` ] && ok || not_ok

echo;
echo -e "\033[1m4. Sprawdzanie istnienia wpisu w /etc/group\033[0m";
[ `grep $group /etc/group` ] && ok || not_ok

echo; 
echo "Haslo uzytkownika $user ustalone podczas pracy programu to: $p";
echo "Dodawanie uzytkownika zakonczone powodzeniem.";
echo "Konczenie pracy programu opeadduser"; echo;
rm /etc/*-openadduser;
exit;

