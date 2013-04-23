# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
pkgname=xspringies
pkgver=1.12
pkgrel=1
pkgdesc="mass and spring simulation system"
arch=('i686' 'x86_64')
url=http://www.cs.rutgers.edu/~decarlo/software.html""
license=('custom:GPL1')
groups=()
depends=('libx11')
source=(http://www.cs.rutgers.edu/~decarlo/software/$pkgname-$pkgver.tar.Z)
md5sums=('14b14916471874e9d0569ab5f4e8d492')
sha256sums=('08a3e9f60d1f1e15d38d62dd62baab18f6ad57ee139b0ef41452be66e4ad6a28')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make -f Makefile.std DDIR=/usr/
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m755 xspringies "${pkgdir}/usr/bin/xspringies"
	mkdir -p "${pkgdir}/usr/lib"
	cp -r lib "${pkgdir}/usr/lib/xspringies"
	install -D -m644 xspringies.man "${pkgdir}/usr/share/man/man1/xspringies.1"
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
