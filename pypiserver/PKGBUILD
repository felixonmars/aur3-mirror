# Contributor: Ralf Schmitt <ralf@systemexit.de>
pkgname=pypiserver
pkgver=0.5.2
pkgrel=1
pkgdesc="pypiserver is a minimal PyPI compatible server for use with pip/easy_install"
arch=('any')
url="http://pypi.python.org/pypi/pypiserver/"
license=('zlib')
depends=('python2')
source=(http://pypi.python.org/packages/source/p/pypiserver/pypiserver-${pkgver}.zip)

md5sums=('987386fc2f27ef653699b95addb9fe5b')
sha1sums=('98ac10278cf45bba9e6684750dafb3d3dd8ab4c1')

build() {
  cd $startdir/src/pypiserver-${pkgver}
  /usr/bin/python2 setup.py install --prefix=/usr --root=$startdir/pkg
}
