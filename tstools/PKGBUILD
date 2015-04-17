# Maintainer: Aliaksey Artamonau <aliaksiej.artamonau@gmail.com>

pkgname=tstools
pkgver=1.11
pkgrel=2
pkgdesc='Cross-platform command line tools for working with MPEG data'

arch=('i686' 'x86_64')
url='http://code.google.com/p/tstools/'
license=('MPL')
depends=()
makedepends=('python2' 'docutils')

source=(http://tstools.googlecode.com/files/tstools-1_11.tgz)
md5sums=('2650a09f828b19bb22829a7828f13cde')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # parallel build causes linker errors
    make -j1 all || return 1

    cd "docs" || return 1
    python2 build_html.py || return 1
}

package() {
    install -d -m755 "${pkgdir}/usr/bin" || return 1
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}" || return 1

    cd "${srcdir}/${pkgname}-${pkgver}/bin"
    install -m755 -t "${pkgdir}/usr/bin" * || return 1

    cd "${srcdir}/${pkgname}-${pkgver}/docs"
    install -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" *.html || return 1
}
