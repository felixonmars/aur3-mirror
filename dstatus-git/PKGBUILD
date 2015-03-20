# Maintainer: David Morgan <dmorgan81@gmail.com>

_pkgname=dstatus
pkgname=$_pkgname-git
pkgver=6b0d1e2
pkgrel=1
pkgdesc="A simple status bar. GIT version"
url="https://github.com/Spitemare/dstatus"
arch=('i686' 'x86_64')
license=('custom:UNLICENSE')
depends=('libx11' 'alsa-lib' 'acpid')
source=("git+https://github.com/Spitemare/dstatus.git")
md5sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
    cd "$srcdir/$_pkgname"
    echo $(git describe --always | sed "s/-/./g")
}

build() {
    cd "$srcdir/$_pkgname"
    sed -i 's/CPPFLAGS =/CPPFLAGS +=/g' config.mk
    sed -i 's/^CFLAGS = -g/#CFLAGS += -g/g' config.mk
    sed -i 's/^#CFLAGS = -std/CFLAGS += -std/g' config.mk
    sed -i 's/^LDFLAGS = -g/#LDFLAGS += -g/g' config.mk
    sed -i 's/^#LDFLAGS = -s/LDFLAGS += -s/g' config.mk
    sed -i "s/^VERSION =/VERSION = ${pkgver}/" config.mk
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR=$pkgdir install
}
