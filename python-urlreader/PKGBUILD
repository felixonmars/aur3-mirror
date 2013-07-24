# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=python-urlreader
pkgver=0.0a1
pkgrel=1
pkgdesc="Simple package for cached URL fetching"
arch=('any')
url="http://pydoc.net/URLReader/latest/"
license=('GPL3')
depends=('python2-distribute')
source=(http://pypi.python.org/packages/source/U/URLReader/URLReader-$pkgver.tar.gz)
md5sums=('5a96519a24099aae05fc0612d9cfd650')

package() {
  cd $srcdir/URLReader-$pkgver

  python2 setup.py install --root=$pkgdir --optimize=1
}