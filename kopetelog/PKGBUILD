# Contributor: David Watzke <david@watzke.cz>
 
pkgname=kopetelog
pkgver=0.3.1
pkgrel=3
pkgdesc="A simple Qt4 Kopete history parser"
url="http://kde-apps.org/content/show.php/KopeteLog?content=56975"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4>=4.3.0')
install="$pkgname.install"
source=("http://arch.watzke.cz/sources/$pkgname-$pkgver.tar.bz2"
	kopetelog.desktop)
md5sums=('5838eb86706e86d41a9fc5e76a7a93e7' \
	 '54edb5dada9e65a26636c9b3a0be936f')

build() { 
	cd "$startdir/src/$pkgname-$pkgver"

	qmake-qt4
	make
}

package() {
	cd "$startdir/src/$pkgname-$pkgver"

	install -D -m 755 kopetelog "$startdir/pkg/usr/bin/kopetelog"
	install -D -m 644 "$srcdir/kopetelog.desktop" "$startdir/pkg/usr/share/applications/kopetelog.desktop"
}
