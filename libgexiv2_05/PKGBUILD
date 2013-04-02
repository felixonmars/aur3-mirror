pkgname=libgexiv2_05
_pkgname=libgexiv2
pkgver=0.5.0
pkgrel=1
pkgdesc='GObject-based wrapper around the Exiv2 library'
arch=('x86_64' 'i686')
url='http://redmine.yorba.org/projects/gexiv2'
license=('GPL2')
depends=('exiv2' 'gobject-introspection')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!libtool')
source=("http://yorba.org/download/gexiv2/${pkgver%.*}/${_pkgname}-$pkgver.tar.xz")
md5sums=('655528168648fd681a061bddaabc79ee')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr --enable-introspection
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
