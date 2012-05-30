# Maintainer: speps <speps at aur dot archlinux dot org>

_name=pysmf
pkgname=python2-$_name
pkgver=0.1.0
pkgrel=1
pkgdesc="A Python module for Standard MIDI Files, based on libsmf."
arch=(i686 x86_64)
url="http://das.nasophon.de/pysmf/"
license=('custom:BSD')
depends=('python2' 'libsmf')
makedepends=('python2-distribute' 'cython2')
source=("http://das.nasophon.de/download/$_name-$pkgver.tar.gz")
md5sums=('a0c91ca9d41b8cd00adaba10e3a4546d')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/"

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
