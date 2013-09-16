# $Id$
# Maintainer: Gareth Coco <garethcoco@gmail.com>
# Contributor: Gareth Coco <garethcoco@gmail.com>

pkgname=srmio
pkgver=0.1.1~git1
pkgrel=1
pkgdesc="srmio is a small C library to access the PowerControl of a SRM bike power meter. It's implementing the serial communication protocol to the PowerControls V, VI and 7."
arch=('i686' 'x86_64')
license=('BSD')
url="http://www.zuto.de/project/srmio/"
depends=()
makedepends=()
source=(http://www.zuto.de/project/files/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('0db685d6046fca38ad64df05840d01b5f3b27499')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure -prefix=/usr --enable-static --enable-shared
    make -j4
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make prefix="${pkgdir}/usr" install
}

