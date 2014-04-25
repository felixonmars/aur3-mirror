# Maintainer: Carl George <carl@carlgeorge.us>

_pyname="click"
_pyver="3"
pkgname="python${_pyver}-${_pyname}"
pkgver="0.1"
pkgrel="1"
pkgdesc="Command Line Interface Creation Kit"
arch=("any")
url="http://click.pocoo.org/"
license=("BSD")
source=("https://github.com/mitsuhiko/${_pyname}/archive/master.tar.gz")
sha256sums=("34e58b1072bc0b96eb8a5b49005c95723902811e638ef456bc5715edb797ca2d")

package() {
	depends=("python${_pyver}")
	cd ${srcdir}/${_pyname}-master
	python${_pyver} setup.py install --root=${pkgdir} --optimize=1
}
