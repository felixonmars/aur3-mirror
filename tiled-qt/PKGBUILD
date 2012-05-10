#Maintainer: Jonathan Fine (were.Vire AT gmail DOT com)
#tmxviewer.desktop removed because the program must be run from command line
# because it needs a tmx file to open as an argument

pkgname=tiled-qt
pkgver=0.8.1
pkgrel=1
pkgdesc='Tiled is a general purpose tile map editor, built to be flexible and easy to use.'
arch=('i686' 'x86_64')
url='http://mapeditor.org'
license=('GPL')
depends=('qt')
conflicts=(tiled)
replaces=(tiled)
source=(http://sourceforge.net/projects/tiled/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz
	tiled.desktop)
md5sums=('2a8b42e5b956562a184ab0f2b926cac7'
         '3c44178b349de1c1a5f56b08d229c2f4')
build() {
        cd $srcdir/$pkgname-$pkgver
        qmake -r PREFIX=/usr
        make
}

package() {
	cd $srcdir
	install -D -m 644 tiled.desktop "$pkgdir/usr/share/applications/tiled.desktop"
	cd $pkgname-$pkgver
        make install INSTALL_ROOT=$pkgdir

	install -D -m 644 "src/tiled/images/tiled-icon-16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/tiled-icon.png"
	install -D -m 644 "src/tiled/images/tiled-icon-32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/tiled-icon.png"
	install -D -m 644 "src/tiled/images/tiled-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/tiled-icon.svg"

	cd src/libtiled
	for i in *.h
	do
		install -D -m 644 $i "$pkgdir/usr/include/libtiled/$i"
	done
}
