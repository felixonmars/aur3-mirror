# Maintainer: Beneldr <beneldr (dot) aur (at) gmail (dot) com>

pkgname=python-ass
pkgver=0.4.1
pkgrel=1
pkgdesc="A library for parsing and manipulating Advanced SubStation Alpha subtitle files"
arch=('i686' 'x86_64')
url="https://github.com/rfw/python-ass"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/a/ass/ass-$pkgver.tar.gz)
md5sums=('04d0210df36944b6f7f5ba42badabba1')

package() {
  cd "$srcdir/ass-$pkgver"
  python setup.py -q install --root="$pkgdir" --optimize=1
}
