# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=toico
pkgver=1.1
pkgrel=1
pkgdesc='A tool to create Windows icons'
arch=('i686' 'x86_64')
url="http://wizard.ae.krakow.pl/~jb/toico/"
license=('GPL')
depends=('libpng' 'libtiff')
source=("http://wizard.ae.krakow.pl/~jb/toico/toico-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/toico-${pkgver}"
	make
}

package() {
	cd "${srcdir}/toico-${pkgver}"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm644 "${pkgdir}/usr/share/man/man1"
	make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/share/man" install
}

md5sums=('1b5bc18d1aa17b41633bef0160fbb903')
