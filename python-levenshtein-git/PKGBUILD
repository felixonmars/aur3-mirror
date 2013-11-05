# Maintainer: Jason St. John <jstjohn .. purdue . edu>

pkgname=python-levenshtein-git
_pkgname=python-Levenshtein
pkgver=9.3c3ebd8
pkgrel=1
pkgdesc='A Python 3 library for Levenshtein edit distance or Jaro-Winkler algorithms.'
url="https://github.com/miohtama/${_pkgname}"
license=('GPL2')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/miohtama/${_pkgname}.git")
sha1sums=('SKIP')

pkgver() {
	cd "${_pkgname%-git}"
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd "${_pkgname%-git}"

	python setup.py build
}

package() {
	cd "${_pkgname%-git}"

	python setup.py install --prefix=/usr --root="${pkgdir}/" --optimize=1
}
