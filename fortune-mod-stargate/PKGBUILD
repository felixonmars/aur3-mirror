# Maintainer: Moritz Hilscher <m0r13@mapcrafter.org>

pkgname=fortune-mod-stargate
pkgver=v0.1.r0.g4c1a574
pkgrel=1
pkgdesc="Stargate fortune cookies."
arch="any"
url="https://github.com/m0r13/fortune-mod-stargate"
license=("MIT")
makedepends=()
depends=("fortune-mod")
source=("$pkgname"::"git://github.com/m0r13/fortune-mod-stargate.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make directory="$pkgdir/usr/share/fortune" install

    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
