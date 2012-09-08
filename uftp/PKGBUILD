# Maintainer: Markus Jochim <ich@markusjochim.de>
pkgname=uftp
pkgver=3.7
pkgrel=2
pkgdesc="Multicast FTP software"
arch=(i686 x86_64)
url="http://www.tcnj.edu/~bush/uftp.html"
license=('GPL')
source=(http://www.tcnj.edu/~bush/downloads/uftp-${pkgver}.tar)
md5sums=('25888397ae79d1e9eeead999f2ea62b8')

build() {
	cd "$srcdir/uftp-${pkgver}/"

	make || return 1
	make DESTDIR="${pkgdir}" install
}

