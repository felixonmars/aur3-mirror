echo ""
echo " ------------------------------------------------------------ "
echo " lescienze500.data - ATTENZIONE - "
echo ""
echo " Tutti i files estratti dall'archivio install.dmg sono "
echo " protetti da copyright e propieta di  - Somedia Spa - "
echo " Il pacchetto generato con questa procedura deve essre usato "
echo " a titolo esclusivamente privato. "
echo " La distribuzione mediante qualsiasi mezzo del package generato da questo script è VIETATA "
echo ""
echo " L'autore di questo script non fornirà in nessun modo il file install.dmg"
echo ""
echo " Ho letto l'avviso e accetto le condizioni (si) (no) "

read  rispo

if [ $rispo != "si"  ] ; then
	echo "Non hai accettato le condizioni; procedura terminata"
	exit 1
fi


if [ -e install.dmg ] ; then 
	ARCHLS=install.dmb
elif [ -e  /media/LESCIENZE/install.dmg ] ; then
	ARCHLS=/media/LESCIENZE/install.dmg
else
	echo "ipossibile trovare il file install.dmg"
	echo "copiare il file nella directory corrente" 
	echo "oppure inserire il DVD 1 e montarlo in:"
	echo "/media/LESCIENZE"
	exit 1
fi

7z -o. -y x $ARCHLS 2.hfs
7z -o. -y x ./2.hfs Le\ Scienze\ -\ 500\ Numeri/Le\ Scienze\ -\ 500\ Numeri/copertine/
7z -o. -y x ./2.hfs Le\ Scienze\ -\ 500\ Numeri/Le\ Scienze\ -\ 500\ Numeri/data/LeScienze.db
rm ./2.hfs

