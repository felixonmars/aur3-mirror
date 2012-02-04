# Contributor: Jakub Luzny <limoto94@gmail.com>
pkgname=gpclient
pkgver=1.0_alpha5
pkgver_orig=1.0-alpha5
pkgrel=2
pkgdesc='Unofficial client for GamePark.cz server'
arch=(i686 x86_64)
url="http://gpclient.dolezel.info/"
license=('GPL')
depends=('qt>=4.0.0' 'openssl')
makedepends=()
provides=()
source=(http://www.dolezel.info/download/data/${pkgname}/${pkgname}-${pkgver_orig}.tar.bz2)
md5sums=('489f928b6767fe763dab7e6a9eb9e0d3')

build() {
	cd "$srcdir/${pkgname}-${pkgver_orig}/"

	qmake
	make

	mkdir -p "$pkgdir/usr/bin/"
	install -Dm 775 gpclient "$pkgdir/usr/bin/"
}

#category: games
# vim:set ts=2 sw=2 et: 
