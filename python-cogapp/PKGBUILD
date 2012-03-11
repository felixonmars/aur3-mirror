# Contributor: Vladimir Ermakov <vooon341@gmail.com>

pkgname=python-cogapp
pkgver=2.3
pkgrel=1
pkgdesc="A code generator for executing Python snippets in source files."
arch=('any')
url="http://nedbatchelder.com/code/cog/"
license=('MIT')
depends=('python')
makedepends=('setuptools')
replaces=('python-cog')
install=
source=(http://pypi.python.org/packages/source/c/cogapp/cogapp-${pkgver}.tar.gz)
md5sums=('d001313188b2ef41b70276eeed417f04')

build() {
  cd $srcdir/cogapp-${pkgver}

  python setup.py build
}

package() {
  cd $srcdir/cogapp-${pkgver}

  python setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1
}
# vim:set ts=2 sw=2 et:
