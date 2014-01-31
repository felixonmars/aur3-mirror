# Maintainer: Jason St. John <jstjohn .. purdue . edu>

pkgname=python2-crm114
_pkgname=crm114
_githubname=crm114-python
pkgver=2.0.2
pkgrel=1
pkgdesc="Python 2 wrapper classes for the CRM114 Discriminator"
arch=('any')
url="https://github.com/briancline/${_githubname}"
license=('MIT')
depends=('python2' 'crm114')
options=('!emptydirs')
source=("${_githubname}-${pkgver}.tar.gz::https://github.com/briancline/${_githubname}/archive/v${pkgver}.tar.gz")
sha512sums=('20887d654a40598c70cf04a4d9e5d7fbd0f9f63e015f2d3829eb3e27de8e5c79193fd10eb0f66d2d492340245d02e99ab3f3f05e7177c7ee9b5c422f511de79b')

package() {
	cd "${_githubname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
}
