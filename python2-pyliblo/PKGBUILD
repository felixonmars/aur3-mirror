# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>

_name=pyliblo
pkgname=python2-$_name
pkgver=0.9.1
pkgrel=1
pkgdesc='Python wrapper for the liblo OSC library'
arch=('i686' 'x86_64')
url='http://das.nasophon.de/pyliblo/'
license=('LGPL')
depends=('python2' 'liblo')
makedepends=('cython')
provides=("$_name")
conflicts=("$_name")
replaces=("$_name")
source=("http://das.nasophon.de/download/$_name-$pkgver.tar.gz")
md5sums=('eb2b2b86031b702eba8e65da75fbaacc')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}