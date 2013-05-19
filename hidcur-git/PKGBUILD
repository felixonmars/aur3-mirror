# Maintainer: Bastien Dejean <baskerville@lavabit.com>

_pkgname=hidcur
pkgname=${_pkgname}-git
pkgver=70
pkgrel=1
pkgdesc='Utility for hiding the mouse cursor in X'
arch=('i686' 'x86_64')
url="https://github.com/jimenezrick/${_pkgname}"
license=('custom:WTFPL')
depends=('libxcb')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/jimenezrick/${_pkgname}.git")
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
    install -D -m 644 COPYING "$pkgdir/usr/share/licenses/$_gitname/COPYING"
}
