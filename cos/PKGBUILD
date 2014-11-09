# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Javier "Phrodo_00" Aravena Claramunt <javier@aravenas.com>
pkgname=cos
_pkgver=0.8
pkgver=0.8_200906
pkgrel=2
pkgdesc="C89 library lifting C to the level of other OOPLs and beyond"
arch=('x86_64' 'i686')
url="http://ldeniau.web.cern.ch/ldeniau/oopc.html"
license=('GPL3' 'LGPL3')
changelog=ChangeLog
depends=('glibc' 'sh')
source=("http://downloads.sourceforge.net/project/cos/C Object System/${_pkgver}/cos-${pkgver}.tgz")
sha256sums=('521fef45c1aeeb34ed397ad950a34cdb9021e80f8b8d31e19f3a032df680129b')

build() {
    cd "${srcdir}/${pkgname}"
    make
}

check() {
    cd "${srcdir}/${pkgname}"
    make tests
}

package() {
    cd "${srcdir}/${pkgname}"
    make PREFIX="$pkgdir/usr/" install

    # remove license files, they are standard GPL3 and LGPL3
    rm "${pkgdir}/usr/share/doc/${pkgname}/COPYING"
    rm "${pkgdir}/usr/share/doc/${pkgname}/COPYING.LESSER"
}
