# Maintainer: Liganic <liganic-aur@gmx.org>

pkgname=basenji-taglib-bzr
pkgver=520
pkgrel=1
pkgdesc="Volume indexing tool designed for easy and fast indexing of volume collections. [taglib branch]"
arch=('any')
url="https://launchpad.net/basenji"
license=('GPL')
depends=('mono' 'gtk-sharp-2' 'gnome-sharp' 'gio-sharp' 'ndesk-dbus-glib' 'udisks')
optdepends=('taglib: for metadata extraction')
makedepends=('bzr' 'python2')
provides=('basenji')
conflicts=('basenji')
_bzrtrunk=https://code.launchpad.net/~pulb/basenji/basenji-taglib
_bzrmod=$pkgname

build() {
    cd $srcdir

    msg "Connecting to the server...."
    if [ ! -d $_bzrmod/.bzr ]; then
        bzr co --lightweight $_bzrtrunk $_bzrmod
    else
        bzr up $_bzrmod
    fi

    msg "Bazaar checkout dont or server timeout"

    if [ -d $_bzrmod-build ]; then
        rm -rf $_bzrmod-build
    fi
    cp -r $_bzrmod $_bzrmod-build
    msg "Starting make..."
    cd $_bzrmod-build
    ./configure --prefix=/usr
    make
    make DESTDIR="$pkgdir" install
    rm -rf $_bzrmod-build
}
