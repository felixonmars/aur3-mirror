# Maintainer: Bastien Dejean <baskerville@lavabit.com>

_pkgname=z.go
pkgname=${_pkgname}-git
pkgver=15
pkgrel=1
pkgdesc='Wu wei terminal directory jumping'
arch=('i686' 'x86_64')
url="https://github.com/baskerville/Z"
license=('custom:Unlicense')
makedepends=('git' 'go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git://github.com/baskerville/Z.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -p LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
