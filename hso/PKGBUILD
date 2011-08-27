# $Id$
# Maintainer: Guillaume DUMOULIN <guillaume.dumoulin@gmail.com>
# Contributor: elsixdiab

pkgname=hso
pkgver=1.6
pkgrel=1
pkgdesc="hso kernel drivers for HSDPA modem"
arch=('i686' 'x86_64')
url="http://www.pharscape.org/hso.html"
license=('GPL') 
depends=("kernel26")
makedepends=()
install=hso.install
source=("hso-${pkgver}.tar.gz::http://www.pharscape.org/forum/index.php?action=dlattach;topic=544.0;attach=3")
_kernver=2.6.28-ARCH
_installdir=/lib/modules/${_kernver}/kernel/drivers/net/wwan/
md5sums=('c5404f3efd2c678ecac80b26038d177c')

build() {
	cd $srcdir/$pkgname-$pkgver
    	make || return 1
	install -m755 -d "${pkgdir}/${_installdir}"
	install -m644 hso.ko "${pkgdir}/${_installdir}" || return 1
}
