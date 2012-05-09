# Contributor: Mateusz Herych <heniekk@gmail.com>
pkgname=natdet
pkgver=1.0.7
pkgrel=1
pkgdesc="Simple program for NAT detection"
arch=('i686' 'x86_64')
url="http://elceef.itsec.pl/natdet/"
license=('GPL2')
depends=('libpcap')
source=("http://elceef.itsec.pl/natdet/natdet-${pkgver}.tar.gz")
sha256sums=('b4443404dd1430b1c6b97d788d465f9aa1e020e4a4faa15988737da3f1a1f0b6')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	sed -i 's/local//g' config.h
	./configure
	mkdir -p ${pkgdir}/usr
	make || return 1
	make install PREFIX=${pkgdir}/usr || return 1
}
