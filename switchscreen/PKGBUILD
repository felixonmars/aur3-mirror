# Maintainer: Sopo <sopo.mop@gmail.com>
# Contributor: Sopo <sopo.mop@gmail.com>
# $Id$
pkgname=switchscreen
pkgver=0.4
pkgrel=1
pkgdesc="Switch between monitors (dual-screen setup)"
arch=(i686)
license=('GPL')
url="http://unlogical.net/"
depends=(libxtst)
source=(http://unlogical.net/files/scripts/${pkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('0ca5521d90d3fcb67aedfea2ea0f2f0e')

build() {
	cd $srcdir/$pkgname
	make || return 1
	install -DTm755 $srcdir/$pkgname/switchscreen $pkgdir/usr/bin/switchscreen
}
