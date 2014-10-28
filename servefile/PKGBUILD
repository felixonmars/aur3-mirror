# Maintainer: Gordin <9ordin @t gmail dot com>

pkgname='servefile'
pkgver=0.4.3
pkgrel=1
pkgdesc='Serve files from shell via a small HTTP server'
arch=('any')
url='http://seba-geek.de/stuff/servefile/'
license=('GPL3')
depends=('python2')
makedepends=('python2')
optdepends=('python2-pyopenssl: for any functionanlity related to SSL')
source=("http://seba-geek.de/proj/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('53564c0cf4791ce2dbe86aeae9b7f436d85a1b6d0d2d04de1afd237943363c83')

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python2 setup.py install --root=${pkgdir}
    mkdir -p ${pkgdir}/usr/share/man/man1
    gzip -9 -c ${pkgname}.1 > ${pkgdir}/usr/share/man/man1/${pkgname}.1.gz
}
