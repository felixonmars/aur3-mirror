# Maintainer: Tobias Witt <tobiaswitt@outlook.de>
# Contributor: Sebastien Binet <binet@lblbox>
pkgname=python-visvis
pkgver=1.8
pkgrel=1
pkgdesc="Visvis is a pure Python library for visualization of 1D to 4D data in an object oriented way."
url="http://code.google.com/p/visvis/"
arch=('i686' 'x86_64')
license=('BSD New')
depends=('python' 'python-numpy' 'python-opengl' 'python-imaging')
makedepends=()
conflicts=()
source=(http://visvis.googlecode.com/files/visvis-$pkgver.zip)

build() {
  cd $srcdir/visvis-$pkgver
  python setup.py build || return 1
  python setup.py install --prefix=/usr --root=$pkgdir || return 1
}

md5sums=('d95a159f89720d1b6f1f8639f7a6889f')
