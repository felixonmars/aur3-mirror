# Maintainer: Bastien Dejean <baskerville@lavabit.com>

_pkgname=dmenu-q-xywh-xft
pkgname=${_pkgname}-git
pkgver=4
pkgrel=1
pkgdesc='Dynamic X menu - with the xft and q-xywh patches applied'
arch=('i686' 'x86_64')
url="https://github.com/baskerville/${_pkgname}"
license=('MIT')
depends=('sh' 'libxinerama' 'libxft')
makedepends=('git')
provides=('dmenu')
conflicts=('dmenu')
source=("git://github.com/baskerville/${_pkgname}.git")
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
