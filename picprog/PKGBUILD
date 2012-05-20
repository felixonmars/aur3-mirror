# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=picprog
pkgver=1.9.1
pkgrel=1
pkgdesc="PIC16, PIC12 and PIC18 microcontroller programmer for Linux."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs')
url="http://hyvatti.iki.fi/~jaakko/pic/picprog.html"
source=("http://www.iki.fi/hyvatti/pic/${pkgname}-${pkgver}.tar.gz")
md5sums=(2abd6fa5f6edabf3336b4d526fef3dae)

build() {
	cd "$srcdir/picprog-$pkgver"
	
	sed -i "s_/usr/local/_$pkgdir/usr/_" Makefile
	sed -i "s_/usr/man/_/usr/share/man/_" Makefile
	
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/man/man1/"
	
	cd "$srcdir/picprog-$pkgver"
	
	make install
}
