# Maintainer: Roman Neuhauser <neuhauser+libcmime@sigpipe.cz>
pkgname=libcmime
pkgver=0.1.14
pkgrel=1
pkgdesc="A lightweight mime library, written in C"
arch=(i686 x86_64)
url="http://libcmime.org"
license=(MIT)
depends=(glibc)
makedepends=(cmake)
source=($url/files/$pkgname-$pkgver.tar.gz)
sha256sums=(939fe3890e2ea467866812c2c8677591f3b55244a8f731d34737c49de8877a2e)

build() {
  mkdir "$srcdir/build"
  cd "$srcdir/build"
  cmake "$srcdir/$pkgname-$pkgver" -DPREFIX:STRING=/usr -DCMAKE_INSTALL_LIBDIR:STRING=lib -DENABLE_DOC=TRUE
  make
  make doc
}

package() {
  cd "$srcdir/build"
  make install DESTDIR="$pkgdir"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname"
}

