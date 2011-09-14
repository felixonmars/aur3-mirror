_pkgname=periodictable
pkgname=python2-${_pkgname}
pkgver=1.3.0
pkgrel=1
pkgdesc="Extensible periodic table of the elements"
license=('custom') # Public Domain
arch=('i686' 'x86_64')
url=http://pypi.python.org/pypi/periodictable
depends=('python2')
source=(http://pypi.python.org/packages/source/p/periodictable/${_pkgname}-$pkgver.tar.gz)
md5sums=('70fec0ec8a93fae2d807b1630f83f770')

build() {
  cd $startdir/src/${_pkgname}-$pkgver

  python2 setup.py install --root=$pkgdir/

  install -D -m644 doc/sphinx/guide/license.rst \
		   $pkgdir/usr/share/licenses/$pkgname/license.rst
}
