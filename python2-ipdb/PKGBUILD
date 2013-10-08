# Maintainer: N30N <archlinux@alunamation.com>
# Contributor: giniu <gginiu@gmail.com>

pkgname=("python2-ipdb")
pkgver=0.8
pkgrel=1
pkgdesc="IPython-enabled pdb"
url="http://pypi.python.org/pypi/ipdb"
source=("https://pypi.python.org/packages/source/i/ipdb/ipdb-${pkgver}.zip")
md5sums=("96dca0712efa01aa5eaf6b22071dd3ed")
depends=("ipython2")
makedepends=("python2-distribute")
arch=("any")
license=("GPL")

build() {
	cd "${srcdir}/ipdb-${pkgver}"
	python2 setup.py install --root="${pkgdir}"
}

# vim: set noet ff=unix:
