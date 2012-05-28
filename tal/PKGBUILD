pkgname=tal
pkgver=1.9
pkgrel=1
pkgdesc="Trailer Alignment Filter Program"
arch=('i686' 'x86_64')
url="http://thomasjensen.com/software/tal"
license=('custom')
depends=()
makedepends=()
optdepends=()
options=()
source=(http://thomasjensen.com/software/tal/tal-1.9.tar.gz)
md5sums=('a22e53f5f0d701a408e98e480311700b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    OS=linux make || return 1

    install -D -m 755 tal "${pkgdir}/usr/bin/tal"
    install -D -m 644 tal.1 "${pkgdir}/usr/share/man/man1/tal.1"
}

