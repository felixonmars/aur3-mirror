# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
# Contributor: Carl George <carl@cgtx.us>

pkgname=python2-click-3.1
_pkgname=click
pkgver="3.1"
pkgrel="1"
pkgdesc="Command Line Interface Creation Kit"
arch=("any")
url="http://click.pocoo.org/"
depends=("python2>=2.6")
conflicts=("python2-click")
provides=("python2-click")
license=("BSD")
makedepends=("python2-setuptools")
checkdepends=("python2-pytest")
source=("https://github.com/mitsuhiko/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a6bec2c94081f830c23c14ec0f59272920c40cd9cbc2162c20d8036955dfc65d')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python2 setup.py build
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python2 setup.py test
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
