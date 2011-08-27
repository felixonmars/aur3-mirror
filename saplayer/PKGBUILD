# Contributor: jezra lickter <jezra at jezra dot net>
# Maintainer: timttmy <marshall\\dot//cleave\\at//tiscali\\dot//co\\dot//uk>

pkgname=saplayer
pkgver=0.5.1
pkgrel=1
pkgdesc="A simple audio player(sap) for the command line, utilizing gstreamer and ncurses"
url="http://www.jezra.net/projects/sap"
depends=('gstreamer0.10-base' 'ncurses')
makedepends=('gcc' 'make' 'intltool' 'pkgconfig')
conflicts=('sap')
license="GPL"
source=(http://launchpad.net/sap+/0.5/$pkgver/+download/sap-$pkgver-2.tar.gz)
md5sums=('d3e077abf1c0036d400b1a142932f22c')
arch=('i686' 'x86_64')

build() {
	cd $srcdir/sap-$pkgver
	./configure --prefix=/usr/
	make || return 1
	make DESTDIR=$pkgdir install
}
