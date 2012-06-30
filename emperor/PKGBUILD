pkgname=emperor
pkgver=0.2
pkgrel=1
pkgdesc="Orthodox file manager for GNOME"
arch=('i686' 'x86_64')
url="http://code.jollybox.de/emperor.xhtml"
license=('GPL')
depends=('libgee-0.8>=0.7' gtk3 libxml2 libnotify)
makedepends=('intltool>=0.35.0')
source=(http://code.jollybox.de/pub/${pkgname}/${pkgname}-${pkgver}.tar.xz)
install=emperor.install

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr 
  make
}

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
  find $pkgdir -name '*.la' -exec '{}' ';'
}


sha256sums=('69f8810ee86811f1f435f24d389fcdc1a5cf32e999702e14ac717a41a177d906')

# vim:set ts=2 sw=2 et:
