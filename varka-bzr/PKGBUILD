# Maintainer: Ner0

pkgname=varka-bzr
pkgver=15
pkgrel=1
pkgdesc="A library on top of gtk to build applications."
arch=('i686' 'x86_64')
url="https://launchpad.net/varka"
license=('GPL3')
depends=('gobject-introspection' 'gtk3' 'glib2')
makedepends=('bzr' 'cmake' 'vala')
source=('bzr+lp:varka')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/varka"
  bzr revno
}

build() {
  cd "$srcdir/varka"
  rm -rf build/ 2>/dev/null
  mkdir build
  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/varka/build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
}
