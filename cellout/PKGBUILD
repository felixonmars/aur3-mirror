# Maintainer: Chris Down <iofc.org@christopher.down>

pkgname=cellout
pkgver=1.0
pkgrel=1
pkgdesc='A simple battery status printer.'
arch=('any')
url="https://github.com/cdown/${pkgname}"
license=('BSD')
source=("http://fakkelbrigade.eu/chris/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('7bd1e423f14dcb1655f9fa2c20d08471')

package() {
    install -d "${pkgdir}/usr/"{bin/,share/man/man1/}

    # Compress the manual page to save a small amount of space.
    gzip -9 "${srcdir}/${pkgname}.1"

    install -m755 \
        "${srcdir}/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"
    install -m755 \
        "${srcdir}/${pkgname}.1.gz" \
        "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
