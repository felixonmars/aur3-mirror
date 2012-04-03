# Maintainer: Nicolas Stalder <nicolas dot stalder at gmail dot com>
pkgname=python2-pyinterval
pkgver="1.0b21"
pkgrel=1
epoch=
pkgdesc="Interval arithmetic in Python."
arch=('x86_64')
url="http://code.google.com/p/pyinterval/"
license=('BSD')
depends=('crlibm')
source=('http://pypi.python.org/packages/source/p/pyinterval/pyinterval-1.0b21.tar.gz')
md5sums=('a65fe9855d3b6b0a9ddcc5b2f1e1e421')


build() {
  cd "$srcdir/pyinterval-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/pyinterval-$pkgver"
  mkdir -p       $pkgdir/usr/lib/python2.7/site-packages/interval
  echo $(pwd)
  cp             build/lib.linux-x86_64-2.7/interval/*.py \
                 $pkgdir/usr/lib/python2.7/site-packages/interval
  install -D     build/lib.linux-x86_64-2.7/crlibm.so $pkgdir/usr/lib/python2.7
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/python2-pyinterval/LICENSE
}

# vim:set ts=2 sw=2 et:
