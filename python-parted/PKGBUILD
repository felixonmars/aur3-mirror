# Maintainer: Yuanfang Chen   cyfmxc@gmail.com
pkgname=python-parted
_python=python
pkgver=3.10.0
pkgrel=1
pkgdesc="Python bindings for libparted"
arch=('any')
url="https://fedorahosted.org/pyparted/"
license=('GPL')
depends=($_python)
makedepends=()
conflicts=()
source=(https://fedorahosted.org/releases/p/y/pyparted/pyparted-${pkgver}.tar.gz)
sha256sums=('677d8dfab0932c6e482573c3f88b175f593fad3fd6dd9fc7007f0c26a2d74838')

build() {
  cd "$srcdir/pyparted-${pkgver}"
  make
}

package() {
  cd "$srcdir/pyparted-${pkgver}"
  make install DESTDIR=$pkgdir
}
