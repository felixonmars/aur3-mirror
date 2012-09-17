# Maintainer: Michael Seiwald <michael at mseiwald dot at>
pkgname=python2-pynids
_pkgname=pynids
pkgver=0.6.1
pkgrel=1
pkgdesc="A Python wrapper for libnids."
arch=('i686' 'x86_64')
url="http://jon.oberheide.org/pynids/"
license=('GPL')
depends=(glib2 python2 libpcap libnet)
makedepends=()
source=(http://jon.oberheide.org/pynids/downloads/$_pkgname-$pkgver.tar.gz)
md5sums=('6ce600d0130b0feec9a3797a27825d15')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
