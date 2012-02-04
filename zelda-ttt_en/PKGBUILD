pkgname=zelda-ttt_en
pkgver=1.9
pkgrel=1
pkgdesc="Zelda: Return of the Hylian is a fand made Zelda Game"
url="http://www.zeldaroth.fr/"
arch=('i686' 'x86_64')
depends=('sdl_gfx' 'sdl_mixer' 'sdl_image')
license=('Unknown')
makedepends=(imagemagick)
source=("http://www.zeldaroth.fr/us/files/3T/Linux/Zelda3T_US-src-linux.zip" zttt.desktop)
md5sums=('7be729b35d3169887b2ac2ad57b9033a'
         '8c53af29f9f2c1166f565b201749ba5e')

build () {
	cd $srcdir/Zelda3T_US-src-linux/src
	
	# Fix the Game so that it reads save files from $HOME/.zroth
	sed -i -e s~\"data/save/~string\(getenv\(\"HOME\"\)\)+\"/.zttt/~g Joueur.cpp
	
	#Make the game treat /usr/share/zttt as its data directory
	for i in *.cpp
	do
		sed -i -e s~data/~/usr/share/zttt/~g $i
	done
	
	# Create the directory $HOME/.zroth if it doesnt exist
	sed -i -e s~'(NULL));'~'&\n\tif (system(\"stat $HOME/.zttt \&> /dev/null")) system (\"mkdir $HOME/.zttt\");'~ main.cpp
	make
}

package () {
	
	install -Dm644 zttt.desktop $pkgdir/usr/share/applications/zttt.desktop
	cd $srcdir/Zelda3T_US-src-linux/src/
	
	install -Dm755 Zelda3T $pkgdir/usr/bin/zttt
	
	cd data
	for i in {map,music,sound}/*
	do
		install -Dm644 $i $pkgdir/usr/share/zttt/$i
	done
	
	cd images
	for i in */*
        do
                install -Dm644 $i $pkgdir/usr/share/zttt/images/$i
        done
	mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps
	convert logos/fond.png -resize 256x256\! $pkgdir/usr/share/icons/hicolor/256x256/apps/zttt.png
}
