# Maintainer: Jason St. John <jstjohn .. purdue . edu>

pkgname=python-crm114
_pkgname=crm114
_githubname=crm114-python
pkgver=2.0.2
pkgrel=2
pkgdesc="Python 3 wrapper classes for the CRM114 Discriminator"
arch=('any')
url="https://github.com/briancline/${_githubname}"
license=('MIT')
depends=('python' 'crm114')
makedepends=('python-setuptools')
options=('!emptydirs')
source=("${_githubname}-${pkgver}.tar.gz::https://github.com/briancline/${_githubname}/archive/v${pkgver}.tar.gz"
        'basic.py2to3.patch'
        'classifier.py2to3.patch')
sha512sums=('20887d654a40598c70cf04a4d9e5d7fbd0f9f63e015f2d3829eb3e27de8e5c79193fd10eb0f66d2d492340245d02e99ab3f3f05e7177c7ee9b5c422f511de79b'
            'e2fc47ba3f75fdfb0fd8c220d830b695086fa3d29dae1589e6ab45588849754c54d9c4d16213d5f4cffb026ad8046a896c07c759d7fdff9b0a98cbede2d3ac9d'
            '309c27aba8b7b33cac452c3f6aa44709adcc5bcafa7ea661cd53772305d0b68f7cc28697f5ca249ef932e5616f95121a4c1d8497d7d614e0c05588dfbc1085f6')

prepare() {
	cd "${_githubname}-${pkgver}"

	# patch for Python 3 support (patches mostly came from '2to3')
	patch -p0 < "${srcdir}/classifier.py2to3.patch"
	patch -p0 < "${srcdir}/basic.py2to3.patch"
}

package() {
	cd "${_githubname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
