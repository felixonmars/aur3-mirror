# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=newton
pkgver=0.0.9
pkgrel=2
pkgdesc="Dsktop wiki applet for the GNOME2 desktop environment"
url="http://newton.sf.net"
arch=('x86_64')
license=('GPL')
makedepends=('gnome-python-extras')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('04014328fc35adde32b7448571777c82')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/opt/gnome
  make || return 1
  make DESTDIR=$pkgdir install
}
