# Contributor: Vojtěch Aschenbrenner <v@asch.cz>
# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gitname=InvoiceGenerator
_gitbranch=master
pkgname=python2-invoicegenerator-git
pkgver=73.533cf75
pkgrel=1
pkgdesc="Python2 library to generate PDF invoice"
arch=('any')
url="https://github.com/creckx/${_gitname}"
license=('BSD')
depends=('python2' 'python2-reportlab' 'python2-pillow' 'python2-qrplatba>=0.3.3')
makedepends=('git' 'python2-setuptools')
conflicts=(python2-invoicegenerator)
source=("${_gitname}::git://github.com/creckx/${_gitname}.git#branch=${_gitbranch}"
        'fonts.patch')
sha512sums=('SKIP'
            '1ebc74c31c555930e2f7cad677acefeed98e7671ec009e06fcaf7547c9950253617edc8f8415b617fa7cd48523ac7016e019eaafa7447c84811c46b8069999cb')

pkgver() {
	cd "${_gitname}"
	echo "$(git rev-list --count ${_gitbranch}).$(git rev-parse --short ${_gitbranch})"
}

package() {
  cd "${_gitname}"
  patch InvoiceGenerator/conf.py < ../../fonts.patch

  python2 setup.py install --root="${pkgdir}" --optimize=1
}
