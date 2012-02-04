# Contributor: Damien Churchill <damoxc@gmail.com>
pkgname=pyjunitxml
_pkgname=junitxml
pkgver=0.6
pkgrel=1
pkgdesc="A Python unittest TestResult that outputs JUnit compatible XML."
arch=('any')
makedepends=('setuptools')
depends=()
url="https://launchpad.net/pyjunitxml"
license=('Apache License')
source=(http://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz)
md5sums=(cfe9e457b3006b9fc8952bf12d4a1a66)

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	python2 setup.py install --prefix=/usr --root=${pkgdir} || return 1
}
