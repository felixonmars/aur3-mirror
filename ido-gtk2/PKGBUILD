# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=ido-gtk2
_pkgname=ido
pkgver=12.10.0.1
pkgrel=1
pkgdesc="Widgets and other objects used for indicators (GTK+ 2 library)"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicators-gtk2"
license=('LGPL')
depends=('gtk2-ubuntu')
options=('!libtool')
source=(https://launchpad.net/indicators-gtk2/$pkgname/$_pkgname-$pkgver/+download/$_pkgname-$pkgver.tar.gz)
md5sums=('b86f27591a37177f57315bdbaabb403b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
