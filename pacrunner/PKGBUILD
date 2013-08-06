# Author: Gustavo Sverzut Barbieri <barbieri@gmail.com>

pkgname=pacrunner
pkgver=0.7
pkgrel=1
pkgdesc="Proxy Configuration Daemon"
arch=('i686' 'x86_64')
url="http://connman.net/"
license='GPL2'
replaces=('libproxy')
conflicts=('libproxy')
provides=('libproxy') # ???
depends=('curl>=7.16' 'js185' 'glib2' 'dbus')

options=('!emptydirs' '!libtool')
source=("http://www.kernel.org/pub/linux/network/connman/pacrunner-${pkgver}.tar.xz")
sha256sums=('f9528f3b69d96d83805ecce4d05e7c7d6f5dc155b4d76bd8bf4573919966d04b')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure \
    --prefix=/usr \
    --enable-datafiles \
    --enable-curl \
    --enable-libproxy \
    --enable-mozjs \
    --disable-v8 \
    --disable-test
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
