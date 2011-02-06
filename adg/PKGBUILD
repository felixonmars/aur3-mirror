# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=adg
pkgver=0.6.2
pkgrel=1
pkgdesc="Automatic Drawing Generation is a set of functions focused on automating the drawing of mechanical parts."
arch=(i686 x86_64)
url="http://adg.entidi.com/"
license=('GPL')
depends=('gtk2')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('d86429c6f13b566028e524da275002c0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Fix glade3 catalogs path
  sed -i "s|\$(DESTDIR)\$(adg_catalogdir)|$pkgdir/usr/share/glade3/catalogs|" src/Makefile*

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
