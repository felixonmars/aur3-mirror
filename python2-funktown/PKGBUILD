# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Zhehao Mao <zhehao.mao@gmail.com>
pkgname=python2-funktown
pkgver=0.4.6
pkgrel=1
pkgdesc="Functional Data Structures for Python"
arch=('any')
url="https://github.com/zhemao/funktown"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/f/funktown/funktown-$pkgver.tar.gz")
md5sums=('e9aa7c99e593a3fbd0f2269609f78e6d')

build() {
  cd "$srcdir/funktown-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/funktown-$pkgver"

  python2 setup.py install --root=$pkgdir --prefix=/usr || return 1
}

# vim:set ts=2 sw=2 et:
