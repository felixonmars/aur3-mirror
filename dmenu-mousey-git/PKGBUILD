# Maintainer: ben scholz <bbscholz@gmail.com>

_pkgname=dmenu-mousey
pkgname=${_pkgname}-git
pkgver=2
pkgrel=1
pkgdesc='Dynamic X menu - with the xft, mouse, xrdb, and xywh patches applied'
arch=('i686' 'x86_64')
url="https://github.com/benbscholz/dmenu-q-xywh-xft"
license=('MIT')
depends=('sh' 'libxinerama' 'libxft')
makedepends=('git')
provides=('dmenu')
conflicts=('dmenu')
source=("git://github.com/benbscholz/dmenu-q-xywh-xft.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/dmenu-q-xywh-xft"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/dmenu-q-xywh-xft"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
