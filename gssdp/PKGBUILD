# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=gssdp
pkgver=0.12.0
pkgrel=1
pkgdesc="A GObject-based API for handling resource discovery and announcement over SSDP"
arch=(i686 x86_64)
url="http://gupnp.org/"
license=(LGPL)
depends=(libsoup gtk2)
makedepends=(gobject-introspection)
options=(!libtool)
source=(http://download.gnome.org/sources/$pkgname/0.12/$pkgname-$pkgver.tar.xz)
sha256sums=('7f02903989b4ac7cfb7508898706a5b4a01c9ace2f6345bd96bf8a3faa30ae1a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
