# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=libmapper
pkgver=0.2
pkgrel=1
pkgdesc="A system for representing input and output signals on a network and allowing arbitrary “mappings” to be dynamically created between them."
arch=(i686 x86_64)
url="http://idmil.org/software/libmapper/"
license=('GPL')
depends=('alsa-lib' 'liblo' 'python2')
makedepends=('swig')
optdepends=('rtaudio: examples')
options=('!libtool')
source=("http://idmil.org/pub/software/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('82d689fcb89fa4e4843c29233adf9fe0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # python fixes
  export PYTHON=python2
  sed -i "s|python setup.py|python2 setup.py|g" `grep -rl "python setup.py" .`

  # add --root directive for python bindings
  sed -i "s|prefix)$|& --root=\"$pkgdir\"|g" swig/Makefile.*

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
