# $Id: PKGBUILD 100321 2013-11-02 09:15:45Z spupykin $
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: aurelien <aurelien@archlinux.org>

pkgname=ccmalloc
pkgver=0.4.0
pkgrel=4
pkgdesc="Track down memory related problems with C and C++ programs"
arch=('i686' 'x86_64')
url="http://fossies.org/linux/misc/old/$pkgname-$pkgver.tar.gz/fp_index_dc.html"
license=('GPL2')
depends=(sh)
options=(staticlibs)
source=("http://fossies.org/linux/misc/old/$pkgname-$pkgver.tar.gz")
md5sums=('b90d955149569bbc6e801739f099db3d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  sed -i '/\sg++\s/s_\(g++\s\)_\1$(CXXFLAGS) _' "$srcdir/$pkgname-$pkgver"/Makefile
  make CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir"/usr install
  install -d "$pkgdir"/usr/share/doc/"$pkgname"
  find "$srcdir/$pkgname-$pkgver" -maxdepth 1 -name '*[A-Z]' -execdir install -m 644 -t "$pkgdir/usr/share/doc/$pkgname" \{\} +
}
