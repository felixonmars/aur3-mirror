# Maintainer: Jason St. John <jstjohn .. purdue . edu>

pkgname=python2-levenshtein-git
_pkgname=python-Levenshtein
pkgver=9.3c3ebd8
pkgrel=1
pkgdesc='A Python 2 library for Levenshtein edit distance or Jaro-Winkler algorithms.'
url="https://github.com/miohtama/${_pkgname}"
license=('GPL2')
arch=('any')
depends=('python2')
makedepends=('git' 'python2-setuptools')
source=("git+https://github.com/miohtama/${_pkgname}.git")
sha1sums=('SKIP')

pkgver() {
	cd "${_pkgname%-git}"
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd "${_pkgname%-git}"

	python2 setup.py build
}

package() {
	cd "${_pkgname%-git}"

	python2 setup.py install --prefix=/usr --root="${pkgdir}/" --optimize=1
}
