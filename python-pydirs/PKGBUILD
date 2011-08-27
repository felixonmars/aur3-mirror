# Contributor: Hervé Cauwelier <herve ¤ oursours.net>

pkgname=python-pydirs
_pkgver=1.0-beta
# FIXME don't repeat it
pkgver=1.0_beta
pkgrel=3
pkgdesc="very simple object database written in pure Python"
arch=('any')
license=('GPL')
url="http://johnnydebris.net/pydirs.txt"
depends=('python' 'python-pylib')
makedepends=('setuptools')
source=(http://johnnydebris.net/.files/pydirs-$_pkgver.tar.gz)
md5sums=('c9b92b29fb917d5c38d653ab7cc41583')

build() {
  cd "$srcdir/pydirs-$_pkgver"

	python setup.py install --root=${pkgdir} || return 1
}
