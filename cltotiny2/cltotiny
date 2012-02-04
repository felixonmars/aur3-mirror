#!/bin/bash

i=1

if [ -n "`echo "$@"|grep "\-\-silent"`" ]; then                                 
nieloguj=1
else
nieloguj=0                                                                      
fi

if [ -a /tmp/.cltotiny-lock ]; then                                             
pid=`cat /tmp/.cltotiny-lock`                                                   
    if [ -z "`ps $pid|grep "$pid "`" ]; then                                     
    `rm /tmp/.cltotiny-lock`                                                    
    fi                                                                          
fi

if [ -n "`echo "$@"|grep "\-\-kill"`" ]; then
    if [ -a /tmp/.cltotiny-lock ]; then                              
    pid="`cat /tmp/.cltotiny-lock`"
    echo "Wyslanie polecenia zakonczenia"
    `kill $pid`
    if [ -n "`ps $pid|grep "$pid "`" ]; then
    `kill -9 $pid`
    fi
    else
    echo "cltotiny nie jest uruchomiony"
    fi
    i=0                                                                  
fi                                                                              

if [ -n "`echo "$@"|grep "\-\-help"`" ]; then                                                                                                           
echo "Use --silent if you dont want see logs"
echo "Use --kill to stop active copy"
i=0                                                                                                                                            
fi

#ctrl+c
trap 'echo "Zamykanie (bezpieczne)"; rm /tmp/.cltotiny-lock; exit' SIGINT
#close window/...
trap 'echo "Zamykanie (bezpieczne)"; rm /tmp/.cltotiny-lock; exit' SIGHUP
#kill
trap 'echo "Zamykanie (bezpieczne)"; rm /tmp/.cltotiny-lock; exit' SIGTERM

if [ -a /tmp/.cltotiny-lock ] && [ $i != 0 ]; then
echo "Cltotiny is already active (/tmp/.cltotiny-lock exist). PID  `cat /tmp/.cltotiny-lock`"
echo "Use --kill to stop active copy" 
else

if [ $i = 1 ]; then 
    echo $$ > /tmp/.cltotiny-lock 
fi
 
zapytanie=0
while [ $i != 0 ]; do

    if [ $i = 1 ]; then
    staryschowek1="`xsel -p`"
	if [ $? -gt 0 ]; then
	rm /tmp/.cltotiny-lock
	    if [ $nieloguj != 1 ]; then
	    echo "`date +%H:%M:%S` BLAD: xsel: Prawdopodobnie X serwer niejest wlaczony"
	    fi
	exit
	fi
    staryschowek2="`xsel -b`"
        if [ $? -gt 0 ]; then
        rm /tmp/.cltotiny-lock
            if [ $nieloguj != 1 ]; then
            echo "`date +%H:%M:%S` BLAD: xsel: Prawdopodobnie X serwer niejest wlaczony"
            fi
        exit
        fi
    fi
nowyschowek1="`xsel -p`"
if [ $? -gt 0 ]; then
rm /tmp/.cltotiny-lock
    if [ $nieloguj != 1 ]; then                                                                                                                                            
    echo "`date +%H:%M:%S` BLAD: xsel: Prawdopodobnie X serwer zostal wylaczony"                                      
    fi
exit 
fi                                              
nowyschowek2="`xsel -b`"
if [ $? -gt 0 ]; then                                                                                                                                                              
rm /tmp/.cltotiny-lock
    if [ $nieloguj != 1 ]; then                                                                                                                                                    
    echo "`date +%H:%M:%S` BLAD: xsel: Prawdopodobnie X serwer zostal wylaczony"                                                                                                  
    fi
exit                                                                     
fi
#Czy to moze byc link
if [ -z "`echo $nowyschowek1|grep ";"`" ] && [ -z "`echo $nowyschowek1|grep "\ "`" ] && [ "${nowyschowek1:0:1}" != " " ] && [ -n "`echo $nowyschowek1|grep "\."`" ] && [ -n "`echo $nowyschowek1|grep "\/"`" ] && [ -n "`echo $nowyschowek1|grep "^http\:\/\/"`" ] && [ -z "`echo $nowyschowek1|grep "^\/"`" ] && [ -z "`echo $nowyschowek1|grep "^\~"`" ] && [ -z "`echo $nowyschowek1|grep "^\."`" ] && [ "$staryschowek1" != "$nowyschowek1" ] && [ -z "`echo $nowyschowek1|grep rapidshare.com`" ]; then
    if [ -z "`echo $nowyschowek1|grep tiny.pl/`" ]; then
    z=`lynx http://tiny.pl/?adres=$nowyschowek1 --dump | grep "\[6\]"`
	if [ $? -gt 0 ]; then
	    if [ $nieloguj != 1 ]; then
	    zapytanie=$[10#$zapytanie+10#1]
	    echo "$zapytanie) `date +%H:%M:%S` BLAD: Wyslanie zapytania (sch1) $nowyschowek1 NIEUDALO SIE uzyskac odpowiedzi od tiny.pl!"
	    fi
	staryschowek1=$nowyschowek1
	else
	    if [ $nieloguj != 1 ]; then 
	    zapytanie=$[10#$zapytanie+10#1]
	    echo "$zapytanie) `date +%H:%M:%S` Wyslanie zapytania (sch1) $nowyschowek1"
	    fi
	z=${z:6}
	staryschowek1="$z"
	echo -n "$z" | xsel -p
	fi
    else
    `firefox "$nowyschowek1"`&
            if [ $nieloguj != 1 ]; then                                                                 
            zapytanie=$[10#$zapytanie+10#1]                                                             
            echo "$zapytanie) `date +%H:%M:%S` Otwarcie $nowyschowek1"                 
            fi
    staryschowek1=" "
    nowyschowek1=" "
    echo -n " " | xsel -p
    fi
fi

#Czy to moze byc link
if [ -z "`echo $nowyschowek2|grep ";"`" ] && [ -z "`echo $nowyschowek2|grep "\ "`" ] && [ "${nowyschowek2:0:1}" != " " ] && [ -n "`echo $nowyschowek2|grep "\."`" ] && [ -n "`echo $nowyschowek2|grep "\/"`" ] && [ -n "`echo $nowyschowek1|grep "^http\:\/\/"`" ] && [ -z "`echo $nowyschowek2|grep "^\/"`" ] && [ -z "`echo $nowyschowek2|grep "^\~"`" ] && [ -z "`echo $nowyschowek2|grep "^\."`" ] && [ "$staryschowek2" != "$nowyschowek2" ] && [ -z "`echo $nowyschowek2|grep rapidshare.com`" ]; then
    if [ -z "`echo $nowyschowek2|grep tiny.pl/`" ]; then
    z=`lynx http://tiny.pl/?adres=$nowyschowek2 --dump | grep "\[6\]"`
	if [ $? -gt 0 ]; then
	    if [ $nieloguj != 1 ]; then 
	    zapytanie=$[10#$zapytanie+10#1]     
	    echo "$zapytanie) `date +%H:%M:%S` BLAD: Wyslanie zapytania ze (sch2) $nowyschowek2 NIEUDALO SIE uzyskac odpowiedzi od tiny.pl!"
	    fi
	staryschowek2=$nowyschowek2
	else
	    if [ $nieloguj != 1 ]; then 
	    zapytanie=$[10#$zapytanie+10#1]
	    echo "$zapytanie) `date +%H:%M:%S` Wyslanie zapytania ze (sch2) $nowyschowek2"  
	    fi
	z=${z:6}                                                                        
	staryschowek2="$z"                                                              
	echo -n "$z" | xsel -b
	fi
    fi 
fi

sleep 1
i=$[10#$i+10#1]
done

fi
