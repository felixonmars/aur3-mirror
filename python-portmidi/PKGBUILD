# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=python-portmidi
pkgver=0.0.7
pkgrel=1
pkgdesc="A Python wrapper for PortMidi"
arch=(i686 x86_64)
url="http://tarballs.quessy.net/"
license=('GPL')
depends=('python2' 'portmidi')
makedepends=('pyrex')
provides=('pyportmidi')
conflicts=('pyportmidi')
source=("$url$pkgname-$pkgver.tar.gz")
md5sums=('f505d7e0c4abee7f7efcb3183c925ee9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
