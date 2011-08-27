# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=python-feather
pkgver=0.9.1
pkgrel=1
pkgdesc="A small framework for developing small plugin-based applications"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/feather/"
license=('BSD')
depends=('python2')
source=(http://pypi.python.org/packages/source/f/feather/feather-0.9.1dev.tar.gz)
md5sums=('1d3710febcd7b6f8a663aa3e943f9a9b')

build() {
  cd $srcdir/feather-$pkgver*

  python2 setup.py install --root=$pkgdir --optimize=1
}