# Maintainer: Ernesto Ricart <ernest2193@gmail.com>

pkgname=plank-config
pkgver=1.2
pkgrel=2
pkgdesc="A tool to configure Plank Dock"
arch=('i686' 'x86_64')
url="https://github.com/ernest21/Plank-Config/"
license=('GPL')
depends=('plank')
makedepends=('vala')
source=($pkgname-$pkgver.tar.gz::https://github.com/ernest21/Plank-Config/archive/v$pkgver.tar.gz)
md5sums=('7b5ee3842c079166d70aadb9eb14fd77')
install=${pkgname}.install

prepare() {
    cd "${srcdir}/Plank-Config-${pkgver}"
    chmod +x ./autogen.sh
    NOCONFIGURE=1 ./autogen.sh
}
build() {
    cd "${srcdir}/Plank-Config-${pkgver}"
    ./configure \
        --prefix=/usr
    make
}
package() {
    cd "${srcdir}/Plank-Config-${pkgver}"
    make DESTDIR="${pkgdir}" install
}