# Maintainer: David McMackins <mcmackinsd@gmail.com>
pkgname=calccmd
pkgver=0.4.0
pkgrel=1
epoch=
pkgdesc="A free command line calculator"
arch=(any)
url="https://github.com/2mac/calcCMD/"
license=('GPL3')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/2mac/$pkgname/archive/$pkgver.tar.gz)
noextract=()
md5sums=('2290b1dcabf46ff915c537c2a2eaeae1')

build() {
    make -C "$pkgname-$pkgver"
}

package() {
    make -C "$pkgname-$pkgver" PREFIX=/usr DESTDIR="$pkgdir/" install
}
