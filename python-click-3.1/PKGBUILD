# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
# Contributor: Carl George <carl@cgtx.us>

pkgname=python-click-3.1
_pkgname=click
pkgver="3.1"
pkgrel="1"
pkgdesc="Command Line Interface Creation Kit"
arch=("any")
url="http://click.pocoo.org/"
depends=("python")
conflicts=("python-click")
provides=("python-click")
license=("BSD")
makedepends=("python-setuptools")
checkdepends=("python-pytest")
source=("https://github.com/mitsuhiko/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a6bec2c94081f830c23c14ec0f59272920c40cd9cbc2162c20d8036955dfc65d')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py test
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
