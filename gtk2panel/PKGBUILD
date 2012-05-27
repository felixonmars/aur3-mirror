# Maintainer: Nicola Fontana <ntd at entidi.it>

pkgname=gtk2panel
pkgver=0.1.1
pkgrel=1
pkgdesc="A bleeding edge panel heavily based on the GTK+2 stack"
arch=('i686' 'x86_64')
url="http://gtk2panel.entidi.com/"
license=('LGPL')
depends=('gtk2>=2.16.0' 'libwnck')
makedepends=()
optdepends=()
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('31006dddb390e3c0d1f273e1bb402a35')

build() {
    cd $srcdir/$pkgname-$pkgver
    # glade does not support GTK+2 anymore, so disabling it
    ./configure --prefix=/usr --enable-libwnck --without-glade-catalogdir || return 1
    make DESTDIR=$pkgdir install || return 1
}
