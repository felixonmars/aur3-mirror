pkgname=samowar-beta-git
pkgver=51.07510d2
pkgrel=1
pkgdesc="Extremely lightweight music player, written in Qt5 (icons from buuf Deuce theme)"
arch=('any')
url="https://github.com/flyboy14/SamowarMP"
license=('GPL')
makedepends=('git')
depends=('qt5-multimedia')
source=("$pkgname"::'git://github.com/flyboy14/SamowarMP#branch=buggy')
md5sums=( 'SKIP' )

pkgver() {
  cd ${pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}



build() {
	cd "$srcdir/$pkgname"
	qmake
	make
}

package() {
        cd $srcdir/$pkgname
        install -Dm755 ./kurs $pkgdir/usr/bin/samowar	
	mkdir -p $pkgdir/usr/share/samowar $pkgdir/usr/share/applications
        cp -av ./icons $pkgdir/usr/share/samowar/
        chmod -R 655 $pkgdir/usr/share/samowar/
	echo "[Desktop Entry]" >> samowar.desktop
	echo "Encoding=UTF-8" >> samowar.desktop 
	echo "Version=$pkgver" >> samowar.desktop
	echo "Type=Application" >> samowar.desktop
	echo "Terminal=false" >> samowar.desktop
	echo "Exec=/usr/bin/samowar" >> samowar.desktop
	echo "Name=samowar" >> samowar.desktop
	echo "Icon=/usr/share/samowar/icons/samowar.png" >> samowar.desktop
	echo "Categories=AudioVideo;Player;Qt;" >> samowar.desktop
	cp -v ./samowar.desktop $pkgdir/usr/share/applications/
	chmod 655 $pkgdir/usr/share/applications/samowar.desktop
}

