# Maintainer: Dustin Falgout <dustin@antergos.info>

pkgname=openlitespeed
pkgver=1.2.7
pkgrel=1
pkgdesc="a high-performance, lightweight, open source HTTP server."
arch=('i686' 'x86_64')
url="http://open.litespeedtech.com/"
license=('GPL3')
groups=(network)
depends=('geoip' 'openssl' 'expat' 'pcre')
provides=('openlitespeed')
conflicts=('openlitespeed' 'openlitespeed-git')
install=openlitespeed.install
_changelog=http://open.litespeedtech.com/mediawiki/index.php/Release_Log/1.x#V${pkgver}
source=("http://open.litespeedtech.com/packages/openlitespeed-${pkgver}.tgz")
md5sums=('be5f7440c37b864aceefa43ae9fc4c6d')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {

    cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --with-libdir=lib
	make
}


package() {
	cd "${srcdir}/$pkgname-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
