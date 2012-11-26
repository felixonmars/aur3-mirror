# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=python2-e_dbus
_pkgname=python-e_dbus
pkgver=1.7.0
pkgrel=1
pkgdesc="Python2 bindings for E_Dbus"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('e_dbus' 'python2' 'python2-dbus')
options=('!libtool' '!emptydirs')
source=("http://download.enlightenment.org/releases/BINDINGS/python/$_pkgname-$pkgver.tar.bz2")
md5sums=('40b479444bb06147429a276127981890')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  PYTHON=/usr/bin/python2 \
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
