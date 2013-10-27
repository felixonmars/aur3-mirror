# Maintainer: Aleksey Ksenzov aka KsenZ <aksenzov@gmail.com>
pkgname=kdeneur
pkgver=0.17.0
pkgrel=1
pkgdesc="KDE frontend for X Neural Switcher (XNeur)"
arch=('i686' 'x86_64')
url="http://xneur.ru/"
license=('GPLv3')
depends=('qt4' 'kdelibs' "xneur>=${pkgver}")
makedepends=('gcc' 'make')
source=("https://launchpadlibrarian.net/154884174/${pkgname}_${pkgver}.orig.tar.gz")

md5sums=('218a6589caaaca174fe85d372db71ff2')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    
    ./configure --prefix=/usr
    make
}

package() {
    cd $srcdir/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}