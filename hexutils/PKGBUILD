# Maintainer: Steve Engledow <steve at offend dot me dot uk>
pkgname='hexutils'
pkgver=0.4
pkgrel=1
pkgdesc="A tool to convert between character data and hex strings"
arch=('i686' 'x86_64')
license=('MIT')
depends=()
url="http://github.com/stilvoid/"
source=(
    'hexutils.c'
    'LICENSE'
)
md5sums=(
    '88981162c0c354eb638e977b6cbabd6c'
    '272721cc6feb3877bb3671e3c3b65ec7'
)

build() {
    cd "$srcdir"
    gcc -o hexutils hexutils.c
}

package() {
    install -Dm64 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/hexutils" "${pkgdir}/usr/bin/hexutils"
}
