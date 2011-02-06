# Contributor: Vladimir Ermakov <vooon341@gmail.com>

pkgname=python-cog
pkgver=2.1
pkgrel=1
pkgdesc="A code generator for executing Python snippets in source files."
arch=('i686' 'x86_64')
url="http://nedbatchelder.com/code/cog/"
license=('MIT')
depends=('python')
makedepends=('setuptools')
install=
source=(http://nedbatchelder.com/code/cog/cog-${pkgver}.tar.gz
        setup.patch)
md5sums=('ed7082b1d5a7b6c5dfe1769cf873762e'
         '3fb8534a84047a117f9fc8a011b25f64')
         
build() {
  cd $startdir/src/cog-${pkgver}
  
  patch -p0 < $startdir/src/setup.patch

  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
# vim:set ts=2 sw=2 et:
