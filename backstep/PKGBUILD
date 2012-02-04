# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

pkgname=backstep
pkgver=0.3
pkgrel=1
pkgdesc="Icons for minimized windows."
url="http://backstep.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPLv2')
depends=('gtk2' 'x-server')
makedepends=('libxcomposite' 'libxdamage' 'libxfixes' 'libxrender')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('fb8980b7f59b66f87b0bfdb32c3a9032')

build() {
  cd $srcdir/$pkgname-$pkgver
  export RENDER_LIBS="`pkg-config --libs xcomposite xfixes xdamage xrender`"
  export RENDER_CFLAGS="`pkg-config --cflags xcomposite xfixes xdamage xrender`"
  
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}
