# Contributor: Archie <xMickael@ifrance.com>
# Contributor: Byron Clark <byron@theclarkfamily.name>

pkgname=pyexiv2
pkgver=0.3.2
pkgrel=1
pkgdesc="a python binding to exiv2"
depends=('python2' 'boost-libs' 'exiv2')
makedepends=('scons' 'boost')
arch=('i686' 'x86_64')
license=('GPL')
source=(http://launchpad.net/$pkgname/0.3.x/$pkgver/+download/$pkgname-$pkgver.tar.bz2)
md5sums=('9c0377ca4cf7d5ceeee994af0b5536ae')
url="http://tilloy.net/dev/pyexiv2"

build() {
	cd $srcdir/$pkgname-$pkgver
	scons
	scons DESTDIR=$pkgdir install
}
