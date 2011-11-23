# Contributor: Wes Brown <wesbrown18@gmail.com>
pkgname=python2-olefileio
pkgver=0.21
pkgrel=0
pkgdesc="This is a Python library to parse OLE files."
arch=('i686' 'x86_64')
url=("http://www.decalage.info/python/olefileio")
license=('MIT')
depends=('python2')
source=("https://bitbucket.org/decalage/olefileio_pl/downloads/OleFileIO_PL-${pkgver}.zip")
md5sums=('f14e42a6c24755e8cc3b23713648f925')

build() {
  cd "$srcdir/OleFileIO_PL-${pkgver}"
  python2 setup.py build install --root="${pkgdir}" || return 1
}

# vim:set ts=2 sw=2 et:
