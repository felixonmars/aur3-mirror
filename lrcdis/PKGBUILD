# Contributor: GunsNRose<3444542@163.com>
pkgname=lrcdis
pkgver=0.0.2
_pkgdate="090908"
pkgrel=1
pkgdesc="lrcdis is a bash script for auto download lyrics and display it."
arch=('any')
url="http://code.google.com/p/lrcdis"
license=('GPL3')
depends=('bash')
source=(http://lrcdis.googlecode.com/files/${pkgname}.${_pkgdate}.tar.gz)

build() {
    cd $srcdir
    install -d ${pkgdir}/usr/bin
    install -m 0755 $pkgname ${pkgdir}/usr/bin/
}
md5sums=('b2070fcbc8184a676fbeebe7b1be3e95')
