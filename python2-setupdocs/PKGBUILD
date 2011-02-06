# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-setupdocs
pkgver=1.0.5
pkgrel=1
pkgdesc="setuptools plugin that automates building of docs from ReST source"
arch=('any')
url="http://pypi.python.org/pypi/SetupDocs/"
license=('BSD')
depends=('python2' 'python2-distribute' 'python-sphinx>=0.4.2')
optdepends=('texlive-bin: to build pdf documentation')
conflicts=('python-ets-setupdocs-svn')
options=(!emptydirs)

source=("http://www.enthought.com/repo/ETS/SetupDocs-${pkgver}.tar.gz")
md5sums=('d2fd0ea3311d9520ace007364937ce39')

build() {
  cd "$srcdir/SetupDocs-${pkgver}"

  python2 setup.py install --root="$pkgdir"/ --optimize=1 || return 1
}

