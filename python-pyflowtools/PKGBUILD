# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: HomeCreate <homecreate@list.ru>

pkgname=python-pyflowtools
pkgver=0.3.4.1
pkgrel=1
pkgdesc="Python bindings to OSU Flow-Tools library"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pyflowtools/"
license=('GPL2')
depends=('python2' 'flow-tools')
source=(http://pyflowtools.googlecode.com/files/pyflowtools-$pkgver.tar.gz)
md5sums=('25f95080ee0f110a30da0a7c278f2e49')


build() {
  cd "$srcdir/pyflowtools-$pkgver"
  python2 setup.py build_ext
}

package() {
  cd "$srcdir/pyflowtools-$pkgver"
  python setup.py install --prefix=/usr --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
