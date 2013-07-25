# Maintainer: Ludovic Fauvet <etix@l0cal.com>
pkgname=msitools
pkgver=0.93
pkgrel=1
pkgdesc="A set of programs to inspect and build Windows Installer"
arch=('i686' 'x86_64')
url="http://ftp.gnome.org/pub/GNOME/sources/msitools/"
license=('GPL')
depends=('libgsf')
makedepends=('autoconf' 'automake' 'libgcab' 'intltool' 'gobject-introspection')
source=(http://ftp.gnome.org/pub/GNOME/sources/msitools/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('a2d25f05437047749a068946ed019839b88350928511cc7c021ea390413b9dc5')
options=(!libtool)

build() {
    cd $pkgname-$pkgver
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    cp .libs/* .
    make DESTDIR="$pkgdir/" install
}
