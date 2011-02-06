# Contributor: Daniel Strandberg <esodax!nospam!@gmail.com>

_relname=pythonutils
pkgname=python-$_relname
pkgver=0.4.0
pkgrel=1
pkgdesc='Collection of utility modules that simplify common programming tasks in Python'
arch=('any')
url='http://www.voidspace.org.uk/python/pythonutils.html'
license=('BSD')
depends=('python2>=2.2')
provides=('python-configobj=4.6.0'
          'python-validate=1.0.0'
          'python-standout=3.0.0'
          'python-pathutils=0.2.6'
          'python-cgiutils=0.3.6'
          'python-urlpath=0.1.0'
          'python-odict=0.2.2')
source=(http://pypi.python.org/packages/source/P/Pythonutils/$_relname-$pkgver.tar.gz
        LICENSE)
md5sums=('64810ed32dbd83eae98ea7bb40db09a7'
         '703fd6d996ae168b457c4579976c4346')

build() {
  true
}

package() {
  cd $srcdir/$_relname-$pkgver
  python2 setup.py install --root=$pkgdir --prefix=/usr || return 1
  install -Dm644 ../../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:ts=2:sw=2:et:
