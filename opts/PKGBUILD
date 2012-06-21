# Maintainer: Daniel Fiser <danfis@danfis.cz>
pkgname=opts
pkgver=0.1
pkgrel=2
pkgdesc="Opts is a library for parsing command line options"
arch=(i686 x86_64)
url="http://opts.danfis.cz"
license=('BSD')
depends=()
makedepends=(gzip asciidoc bash)
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://libccd.danfis.cz/files/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('011d874a3c143fed5d2a758d4b46f9b0')

build() {
    cd ${pkgname}-${pkgver}

    make
    make doc
}

package() {
    cd ${pkgname}-${pkgver}
    make PREFIX=${pkgdir}/usr install
}
