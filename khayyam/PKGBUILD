# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=khayyam
pkgver=0.2011.03.10
pkgrel=1
pkgdesc="A collection of 3D libraries, mathematics and scene libraries and utilities, the most visible of these a scene builder and character poser Khayyam."
arch=(i686 x86_64)
url="http://floyd.sourceforge.net/"
license=('GPL')
depends=('mesa' 'libglade')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/project/floyd/escher/escher-$pkgver.tar.bz2")
md5sums=('19d0812e82a09e7f75a00ac95a27b2c7')

build() {
  cd "$srcdir/escher-$pkgver"

  # libpng fixes
  sed -i "s|libpng/||g;s|\(png_set_\)\(gray\)|\1expand_\2|" miletos/image.cpp

  ./configure
  make
}

package() {
  cd "$srcdir/escher-$pkgver"

  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
