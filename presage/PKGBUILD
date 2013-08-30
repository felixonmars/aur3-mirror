# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=presage
pkgver=0.8.9
pkgrel=1
pkgdesc="An intelligent predictive text entry platform."
arch=(i686 x86_64)
url="http://presage.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'hicolor-icon-theme' 'python2' 'tinyxml')
makedepends=('cmu-sml-toolkit' 'swig' 'cppunit' 'libtool' 'help2man')
options=('!libtool')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('13221794c5f55f2fde5c5938c59c8548')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # use python2
  export PYTHON=python2
  sed -i 's/env python/&2/' apps/dbus/presage_dbus_*[^.1]

  # DSO link fix
  export LIBS=" -lm -lgmodule-2.0"
}
build() {
  cd "$srcdir/$pkgname-$pkgver"
  LIBS=" -lm -lgmodule-2.0" \
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-static=no \
              --disable-documentation
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et: