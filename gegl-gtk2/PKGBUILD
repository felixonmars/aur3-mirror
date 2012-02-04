# Maintainer: Jon Nordby <jononor@gmail.com>

_pkgname=gegl-gtk
pkgname=gegl-gtk2
pkgver=0.0.7
pkgrel=1
pkgdesc="Convenience library for using GEGL in GTK2 applications" 
arch=(i686 x86_64)
url="http://www.gegl.org"
license=('LGPLv3+')
depends=('gegl' 'gtk2')
makedepends=()
provides=()
conflicts=()
source=(http://www.jonnor.com/files/$_pkgname-$pkgver.tar.bz2)
md5sums=('646b2cf05a636ece6d55a9ba7d179361')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # BUILD
  # Introspection requires gegl from git
  ./configure --prefix=/usr --disable-introspection --with-gtk=2.0 --disable-gtk-doc
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  rm -r $pkgdir/usr/share/gtk-doc/ # FIXME: Causes conflict between gegl-gtk2 and 3
} 
