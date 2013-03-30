# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=seahorse-sharing
pkgver=3.8.0
pkgrel=1
pkgdesc="PGP public key sharing using DNS-SD and HKP"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/seahorse-sharing/"
license=('GPL')
depends=('gtk3' 'gpgme' 'libsoup')
makedepends=('intltool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('e216e7d5709e688e142b4e96710759f5be54c39ac6c2d58f2eec330e4dfef92b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
