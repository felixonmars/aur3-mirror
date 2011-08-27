# Contributor: Paolo Giangrandi <peoro.noob@gmail.com>

pkgname=gooeypy
pkgver=0.1.2
pkgrel=1
pkgdesc="A fast, flexible, and cool looking GUI for pygame."
arch=(i686 x86_64)
url="http://joey101.net/gooeypy/"
license="LGPL"
makedepends=('setuptools')
depends=('python' 'python-pygame')
source=(http://cheeseshop.python.org/packages/source/G/GooeyPy/GooeyPy-0.1.tar.gz)
md5sums=('21b90688878f1d7603ed41c89bd0bad2')

build() {
  cd $startdir/src/GooeyPy-0.1
  python ./setup.py install --root=$startdir/pkg || return 1 
}

