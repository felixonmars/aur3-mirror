# Maintainer: Bastien Dejean <baskerville at lavabit dot com>

_pkgname=mpop
pkgname=${_pkgname}-git
pkgver=399
pkgrel=1
pkgdesc='A small, fast POP3 client suitable as a fetchmail replacement'
arch=('i686' 'x86_64')
url="http://${_pkgname}.sourceforge.net/"
license=('GPL3')
depends=('gnutls' 'libidn')
makedepends=('git' 'autoconf' 'pkg-config')
install=${_pkgname}.install
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://${_pkgname}.git.sourceforge.net/gitroot/${_pkgname}/${_pkgname}")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname"
    [ -d m4 ] || mkdir m4
    autoreconf -i
    ./configure --prefix=/usr --with-ssl=gnutls
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm644 doc/mpoprc.example "$pkgdir/usr/share/mpop/mpoprc.example"
}
