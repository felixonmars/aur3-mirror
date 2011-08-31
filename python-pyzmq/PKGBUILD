# Maintainer: Thomas S Hatch <thatch45 at gmail dot com>
pkgname=python-pyzmq
pkgver=2.1.9
pkgrel=1
pkgdesc="Python3 bindings for zeromq, written in Cython"
arch=(i686 x86_64)
url="http://www.zeromq.org/bindings:python"
license=('LGPL')
depends=(cython zeromq python)
source=(https://github.com/zeromq/pyzmq/downloads/pyzmq-$pkgver.tar.gz)
md5sums=('44efd9e7dd041b9f779e3026d189f870')

build() {
  cd "$srcdir/pyzmq-$pkgver"
  python3 setup.py install --root="$pkgdir" --optimize=1
} 
