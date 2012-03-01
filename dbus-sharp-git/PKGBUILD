# Maintainer: oke3 < Sekereg [at] gmx [dot] com >

pkgname=dbus-sharp-git
pkgver=20120111
pkgrel=1
pkgdesc="C sharp implementation of D-Bus"
url="http://github.com/mono/dbus-sharp/"
arch=('any')
license=('custom')
depends=('mono')
makedepends=('git')
options=('!makeflags')
conflicts=('dbus-sharp')
provides=('dbus-sharp')

_gitroot="git://github.com/mono/dbus-sharp.git"
_gitname="dbus-sharp"

build() {
    cd "$srcdir"

    msg "Connecting to GIT server...."

    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin && cd "$srcdir"
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$_gitname-build"
    git clone "$_gitname" "$_gitname-build"
    cd "$_gitname-build"

    ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var

    make
}

package() {
    cd "$srcdir/$_gitname-build"

    make DESTDIR="$pkgdir" install
    install -D COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
