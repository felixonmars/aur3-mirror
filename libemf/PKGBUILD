# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
pkgname=libemf
pkgver=1.0.4
pkgrel=2
pkgdesc="Enhanced Metafile library"
arch=(any)
url="http://libemf.sourceforge.net/"
license=('GPL')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/libEMF-$pkgver.tar.gz libemf-1.0.4-amd64-alpha.patch)
md5sums=('23effe03c1b2eeb5229f14e461204198' '6a91436f9377ca35dc3613f66922154f')

build() {
  cd "$srcdir/libEMF-$pkgver"
  patch -p1 < ../libemf-1.0.4-amd64-alpha.patch

  ./configure --prefix=/usr --enable-editing
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
