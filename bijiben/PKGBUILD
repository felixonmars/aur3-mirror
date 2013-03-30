# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=bijiben
pkgver=3.7.90
pkgrel=1
pkgdesc="Note editor designed to remain simple to use"
arch=('i686' 'x86_64')
url="https://live.gnome.org/Bijiben"
license=('GPL')
depends=('libtracker-sparql' 'clutter-gtk' 'libzeitgeist' 'webkitgtk3' 'dconf' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'itstool')
options=('!libtool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('096ba05b1c50f99d5806b53682afe72af9d2a52985b031c1518d30a9c717989c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-static --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
