# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Ben <ben@benmazer.net>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Will be useful for building pan until gmime 2.6 is officially proposed

pkgname=gmime26
_pkgname=gmime
pkgver=2.6.3
pkgrel=1
pkgdesc="Core mime parsing library"
arch=('i686' 'x86_64')
license=('GPL')
url="http://spruce.sourceforge.net/gmime/"
depends=('glib2' 'zlib')
makedepends=('gtk-sharp-2' 'pkgconfig')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz)
sha256sums=('6284fde1c73a1944d1a3529ab792bb7984633f619c8f74eb7fe2dfb0fd7c030b')

build() {
  # get rid of that .wapi errors in fakeroot
  export MONO_SHARED_DIR="$srcdir/weird"
  mkdir -p "$MONO_SHARED_DIR"

  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # These are gmime alternatives for the same shareutils tools
  mv "$pkgdir/usr/bin/uuencode" "$pkgdir/usr/bin/guuencode"
  mv "$pkgdir/usr/bin/uudecode" "$pkgdir/usr/bin/guudecode"
}
