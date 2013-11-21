# Maintainer: Jason St. John <jstjohn .. purdue . edu>

pkgname=python-bayes
_pkgname=bayes
pkgver=0.1.1
pkgrel=2
pkgdesc="Bayes classification implementation"
arch=('any')
url="https://pypi.python.org/pypi/${_pkgname}/${pkgver}"
license=('unknown')
depends=('python')
optdepends=('python-redis: support for a Redis backend')
options=('!emptydirs')
source=("https://pypi.python.org/packages/source/b/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        'bayes.py.patch'
        'check.py.patch'
        'classifiers.py.patch'
        'train.py.patch')
sha512sums=('0f493ec204d47b4cd4ef919b564541e2dab3f309b0fb11db91afe78f3da65d40eb8b9e199d63f09031251ce256755136d7db1d376994b2a22adc84c43145ab87'
            '89c24104ad3a8e208a5943864bdc242a724d1527a1069bcea465e34c516a9a02ba3db04fbf417d950c3bc4a64f0e7e3069361cda9a333b429a88906a74b801dc'
            '14ae7cfcd4bf667cd1b9cf48a65d74ca774dc5e4e23e16c745832f6a29e7c1bcff2f9b62b6743603f86b4a561a12263a93ae881ed4e1c152a12c01263e5d07fa'
            '89983d9460a928ee54258335a5bf97d801c368e9729184844fdd8836de63a1dedbea8f963be729cae55b7c21284632413a7236135c0ae685af2618ba1f8a1142'
            '7a986155cfc0134f8652ac6ca6c036339cd67bec427a3155e194fc696b434a418f164e2c6c9b410b9a583f9bcabede45f012af3806e35b1e5c6040d090b66d80')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}"

	# patches made via '2to3'
	patch -p0 < "${srcdir}/bayes.py.patch"
	patch -p0 < "${srcdir}/check.py.patch"
	patch -p0 < "${srcdir}/classifiers.py.patch"
	patch -p0 < "${srcdir}/train.py.patch"
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
}
