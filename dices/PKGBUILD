# Contributor: Eric Forgeot < http://anamnese.online.fr >
pkgname=dices
pkgver=0.7
pkgrel=1
pkgdesc="Dices is an online role game playing software."
arch=(i686 x86_64)
url="http://www.fredbayle.com/index.php?pg=dices-en-home"
license=('GPL')
depends=('fmodex')
makedepends=('qt')
#provides=('')
#backup=()
#groups=()
#options=()
#install=
source=(http://downloads.sourceforge.net/sourceforge/dices/Dices-$pkgver-src.tar.gz)
#noextract=()
md5sums=('4daa3103e8b01c9a2e102d93551794e6')

build() {
	# it needs fmod in its own subfolders
	mkdir $srcdir/Dices-$pkgver-src/FMod_Unix/lib
	mkdir $srcdir/Dices-$pkgver-src/FMod_Unix/inc
	cp /usr/include/fmodex/* $srcdir/Dices-$pkgver-src/FMod_Unix/inc/
	cp /usr/lib/libfmode* $srcdir/Dices-$pkgver-src/FMod_Unix/lib/
	cp /usr/lib/libfmodex.so* $srcdir/Dices-$pkgver-src/Release_Unix/
	
	# start compilation
	cd $srcdir/Dices-$pkgver-src
	qmake 
	make || return 1
  
	# prepare folders for installation
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib
	mkdir -p $pkgdir/usr/share/dices
	mkdir -p $pkgdir/usr/share/dices/Release_Unix
	mkdir -p $pkgdir/usr/share/pixmaps

	# copy the binaries in /usr because they need to reference to data in some subfolders
	cp Release_Unix/libDicesLib.so.1.*  $pkgdir/usr/lib/
	cp Release_Unix/DicesServer $pkgdir/usr/share/dices
	cp Release_Unix/DicesClient $pkgdir/usr/share/dices
	cp Release_Unix/DicesMapEditor $pkgdir/usr/share/dices
	
	# because the client explicit need "../Release_Unix/libfmodex.so"
	# hope it's possible to fix this soon
	cp Release_Unix/libfmodex.so* $pkgdir/usr/share/dices/Release_Unix/
	mkdir -p $pkgdir/usr/share/dices/client
	mv $pkgdir/usr/share/dices/DicesClient $pkgdir/usr/share/dices/client/
	
	ln -sf /usr/share/dices/DicesServer $pkgdir/usr/bin/dicesserver
	#ln -sf /usr/share/dices/DicesClient $pkgdir/usr/bin/dicesclient
	ln -sf /usr/share/dices/DicesMapEditor $pkgdir/usr/bin/dicesmapeditor

	#echo "/usr/share/dices/DicesServer" > $pkgdir/usr/bin/dicesserver
	echo "cd /usr/share/dices/client/ && ./DicesClient" > $pkgdir/usr/bin/dicesclient
	chmod +x $pkgdir/usr/bin/dicesclient
	#echo "/usr/share/dices/DicesMapEditor" > $pkgdir/usr/bin/dicesmapeditor
	
	# for desktop WM
	cp Pixmaps/DicesClient.png $pkgdir/usr/share/pixmaps/
	cp Pixmaps/DicesServer.png $pkgdir/usr/share/pixmaps/
	cp Pixmaps/Map.png $pkgdir/usr/share/pixmaps/DicesMapEditor.png
  
	cp -fr Release_Mac/Avatars/ $pkgdir/usr/share/dices
	cp -fr Release_Mac/Maps/ $pkgdir/usr/share/dices
	cp -fr Release_Mac/Plugins/ $pkgdir/usr/share/dices
	cp -fr Release_Mac/Smileys/ $pkgdir/usr/share/dices
	cp -fr Release_Mac/Translations/ $pkgdir/usr/share/dices
	
	install -D -m644 ../../dicesserver.desktop $pkgdir/usr/share/applications/dicesserver.desktop
	install -D -m644 ../../dicesclient.desktop $pkgdir/usr/share/applications/dicesclient.desktop
	install -D -m644 ../../dicesmapeditor.desktop $pkgdir/usr/share/applications/dicesmapeditor.desktop
	
} 
