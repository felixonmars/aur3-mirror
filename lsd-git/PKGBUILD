# Maintainer: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>

_pkgname=lsd
pkgname=${_pkgname}-git
pkgver=4
pkgrel=1
pkgdesc='Little Status Daemons'
arch=('i686' 'x86_64')
url="https://github.com/raedwulf/${_pkgname}"
license=('custom:Unlicense')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "sutils")
source=("git://github.com/raedwulf/${_pkgname}.git")
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
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
