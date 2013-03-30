# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-getting-started-docs
pkgver=3.8.0.1
pkgrel=1
pkgdesc="Help a new user get started in GNOME"
arch=('any')
url="http://www.gnome.org/"
license=('FDL')
depends=('yelp')
makedepends=('itstool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/3.8/$pkgname-$pkgver.tar.xz)
sha256sums=('299d0f3b6e4a995301cf87ddd8f2ce9e5cae756f82944b1ab50840d8ac6b6897')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
