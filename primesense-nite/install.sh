#!/bin/bash -e
INSTALLROOT=$PACKAGINGDIR/usr
echo "#!/bin/sh " > regscript.sh

if [ "`uname -s`" == "Darwin" ]; then
        LIBEXT="dylib"
else
        LIBEXT="so"
fi

printf "Installing NITE\n"
printf "***************\n\n"

printf "Copying shared libraries... "
cp Bin/libXnVNite*$LIBEXT $INSTALLROOT/lib
cp Bin/libXnVCNITE*$LIBEXT $INSTALLROOT/lib
cp Bin/libXnVNITE.jni*$LIBEXT $INSTALLROOT/lib
printf "OK\n"

# If samples exist then this is a development installation, so headers are needed
if [ -e Samples/Build/Makefile ]
then
	printf "Copying includes... "
	mkdir -p $INSTALLROOT/include/nite
	cp Include/* $INSTALLROOT/include/nite
	printf "OK\n"
fi

printf "Installing java bindings... "
cp Bin/com.primesense.NITE.jar $INSTALLROOT/share/java/
printf "OK\n"

for fdir in `ls -1 | grep Features`
do
	printf "Installing module '$fdir'...\n"
	mkdir -p $INSTALLROOT/etc/primesense/$fdir
	cp -r $fdir/Data/* $INSTALLROOT/etc/primesense/$fdir
	for so in `ls -1 $fdir/Bin/lib*$LIBEXT`
	do
		base=`basename $so`
		printf "Registering module '$base'... "
		cp $so $INSTALLROOT/lib
		echo "niReg /usr/lib/$base /usr/etc/primesense/$fdir" >> regscript.sh
		printf "OK\n"
	done
	for bin in `ls -1 $fdir/Bin | grep XnVSceneServer`
	do
		printf "Copying XnVSceneServer... "
		full=$fdir/Bin/$bin
		cp $full $INSTALLROOT/bin
		chmod +x $INSTALLROOT/bin/$bin
		printf "OK\n"
	done
done
for hdir in `ls -1 | grep Hands`
do
	printf "Installing module '$fdir'\n"
	mkdir -p $INSTALLROOT/etc/primesense/$hdir
	cp -r $hdir/Data/* $INSTALLROOT/etc/primesense/$hdir
	for so in `ls -1 $hdir/Bin/lib*$LIBEXT`
	do
		base=`basename $so`
		printf "registering module '$base'..."
		cp $so $INSTALLROOT/lib
		echo "niReg /usr/lib/$base /usr/etc/primesense/$hdir" >> regscript.sh
		printf "OK\n"
	done
done

if [ -f /usr/bin/gmcs ]
then
	printf "Installing .NET wrappers...\n"
	for net in `ls -1 Bin/*dll`
	do
		gacutil -i $net -package 2.0
		netdll=`basename $net`
		echo $netdll >> $INSTALLROOT/etc/primesense/XnVNITE.net.dll.list
	done
fi

printf "Adding license.. "
LIC_KEY=""
ASK_LIC="1"
while (( "$#" )); do
	case "$1" in
	-l=*)
		ASK_LIC="0"
		LIC_KEY=${1:3}
		;;
	esac
	shift
done
echo "niLicense PrimeSense 0KOIk2JeIBYClPWVnMoRKn5cdY4=" >> regscript.sh
printf "OK\n"

if [ -e Makefile ]
then
	printf "Running make...\n"
	make
fi

printf "\n*** DONE ***\n\n"
