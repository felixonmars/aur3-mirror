# Maintainer: Alister.Hood <gmail>
# Contributor: GnunuX <gnunux chez laposte point net>

pkgname=clens
pkgver="0.2"
pkgrel=4
pkgdesc="Compares your JPEG images with a lens database and automatically corrects lens barrel distortion."
arch=('i686' 'x86_64')
url="http://panotools.sourceforge.net/"
license="GPL"
depends=('glibc')
install=clens.install
source=(http://kent.dl.sourceforge.net/sourceforge/panotools/clens-$pkgver.tar.gz)
md5sums=('d6edfce75bf555a08691d65fade7693d')

build() {
	cd $srcdir/$pkgname-$pkgver/
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver/
	make DESTDIR=$pkgdir install
	mv $pkgdir/usr/doc $pkgdir/usr/share/doc
}

