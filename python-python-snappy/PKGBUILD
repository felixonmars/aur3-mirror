# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=python-python-snappy
pkgver=0.5
pkgrel=1
pkgdesc="Python library for the snappy compression library from Google"
arch=('any')
url="http://github.com/andrix/python-snappy"
license=('BSD')
makedepends=('python-distribute')
depends=('python' 'snappy')
optdepends=('python-cffi')
source=(http://pypi.python.org/packages/source/p/python-snappy/python-snappy-$pkgver.tar.gz)
md5sums=('044fb0ac21888c0b4eee0c4f15e75504')

package() {
  cd $srcdir/python-snappy-$pkgver
  python setup.py install --root=$pkgdir || return 1
}
