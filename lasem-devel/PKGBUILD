# Maintainer: Balló György <ballogyor+arch at gmail dot com>

_pkgname=lasem
pkgname=$_pkgname-devel
pkgver=0.3.4
pkgrel=1
pkgdesc="SVG and Mathml rendering library (development release)"
arch=('i686' 'x86_64')
url="http://blogs.gnome.org/emmanuel/category/lasem/"
license=('LGPL')
depends=('gdk-pixbuf2' 'pango' 'libxml2')
makedepends=('intltool' 'gobject-introspection' 'gtk-doc')
optdepends=('lyx: ttf fonts for MathML')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz)
sha256sums=('4c636a6d9e5c1f81ff0629c7b98d029183642c8c4648aa22c35cacc02617be04')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  mv "$pkgdir"/usr/{,share/}doc
}
