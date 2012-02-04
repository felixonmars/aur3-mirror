# Maintainer: Jesus Jerez <jhuss@archlinux.org.ve>
pkgname=gnome-split
pkgver=1.0
pkgrel=1
pkgdesc="File splitter for GNOME desktop"
arch=('any')
url="http://www.gnome-split.org"
license=('GPL3')
depends=('java-gnome' 'dbus-java')
makedepends=('java-environment')
#install=
changelog=$pkgname.changelog
source=("http://www.gnome-split.org/releases/$pkgname-$pkgver.tar.bz2")
md5sums=('28dde3f26021384def7a302af82f0cc4')
sha256sum=('8b4e350958b5cbce899ea9eb79400c01be3bf0e5d66a430c7a6360bcd4bb4a16')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/mime/packages/"

  make DESTDIR="$pkgdir" install
}