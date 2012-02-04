# Contributor: Jens Staal <staal1978@gmail.com>
pkgname=javahotpot
pkgver=6.1
pkgrel=2
pkgdesc="Java-based educational tool for creating web-based exercises"
url="http://hotpot.uvic.ca/"
arch=('any')
license=('Custom:freeware')
depends=('java-runtime' 'unionfs-fuse')
source=("http://hotpot.uvic.ca/javahotpot61.zip" "hpheader6.gif")
md5sums=('8283f6a693bb144858e055e254836448' '1394f2cdf4663a2845ccade535922213')
_exe=('JavaHotPotatoes6.app/Contents/Resources/Java/hotpot6.jar')
_pkgabbrev=JavaHotPot
_icon=('hpheader6.gif')

build() {
#	copy .jar files and icon
	mkdir -p $pkgdir/usr/share/java/$_pkgabbrev 
	cp -r $srcdir/javahotpot/* $pkgdir/usr/share/java/$_pkgabbrev
	cp -r $_icon $pkgdir/usr/share/java/$_pkgabbrev


#	set-up a per-user start script and a .desktop file

mkdir $pkgdir/usr/bin

printf "#!${SHELL}
if whereis unionfs-fuse>/dev/null 2>&1;
  then
    if whereis jar>/dev/null 2>&1;
	then
		mkdir ~/.$_pkgabbrev
		mkdir ~/.$_pkgabbrev.tmp
		unionfs -o cow -o umask=000 ~/.$_pkgabbrev=RW:/usr/share/java/$_pkgabbrev=RO ~/.$_pkgabbrev.tmp
		java -jar ~/.$_pkgabbrev.tmp/$_exe
		fusermount -u ~/.$_pkgabbrev.tmp
	else
		echo '==> Please make sure to have a java runtime installed and have it in your PATH array.'
    fi
  else
    echo '==> Please make sure to have unionfs-fuse installed and have it in your PATH array.'
fi
return \$?" >> /$pkgdir/usr/bin/$_pkgabbrev.sh 

	chmod +x /$pkgdir/usr/bin/$_pkgabbrev.sh 
	ln -s $_pkgabbrev.sh /$pkgdir/usr/bin/$_pkgabbrev 

	# Automatic generation of a .desktop file

	mkdir -p -m644 $pkgdir/usr/share/ 
	mkdir -p -m644 $pkgdir/usr/share/applications/ 

	printf "[Desktop Entry]
Version=$pkgver
Type=Application
Name=$pkgname
Comment=$pkgdesc
Exec=/usr/bin/$_pkgabbrev
Icon=/usr/share/java/$_pkgabbrev/$_icon
Categories=Education;
Terminal=false
StartupNotify=false" >> /$pkgdir/usr/share/applications/$_pkgabbrev.desktop


#	Install licence file

install -D -m0644 $srcdir/javahotpot/ReadMe6-1-0-5.txt $pkgdir/usr/share/licenses/$_pkgabbrev/ReadMe6-1-0-5.txt

}
