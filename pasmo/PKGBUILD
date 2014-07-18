# Maintainer: The Lemon Man (echo 'dGhhdGxlbW9uQGdtYWlsLmNvbQo=' | base64 -d)
pkgname=pasmo
pkgver=0.5.4.beta2
pkgrel=1
pkgdesc="A portable Z80 cross assembler"
url="http://pasmo.speccy.org"
arch='any'
license=('GPL')
source=("http://pasmo.speccy.org/bin/${pkgname}-${pkgver}.tgz")
md5sums=('c85b0b7935ea174f9a57821019f464fa')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
