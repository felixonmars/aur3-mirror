# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=sha
pkgver=1.1
pkgrel=2
pkgdesc="A simple program that hashes files."
arch=('i686' 'x86_64')
url="http://www.saddi.com/software/sha/"
license=('BSD')
depends=('glibc')
changelog=Changelog
source=("http://www.saddi.com/software/sha/dist/${pkgname}-${pkgver}.tar.gz")
sha256sums=('786159140fbb6647a8fbb5d909c721ff58e27c705333457566985777e3d6d730')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install

	# license
	install -Dm644 README $pkgdir/usr/share/licenses/$pkgname/LICENSE

	# some documentation
	install -dm755 $pkgdir/usr/share/doc/$pkgname
	install -m644 ChangeLog README* $pkgdir/usr/share/doc/$pkgname
}

