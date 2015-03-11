# Contributor: Geoff Teale <tealeg@member.fsf.org>
_pkgname=odfpy
pkgname=${_pkgname}-git
pkgver=125
pkgrel=1
pkgdesc="A complete API for OpenDocument in Python"
arch=('any')
url="http://joinup.ec.europa.eu/software/odfpy/home"
license=('GPL')
depends=('python')
makedepends=('svn')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/eea/odfpy.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  gitversion | tr -d '[A-z]'
}

package() {
  cd "${srcdir}/${_pkgname}"

  python setup.py install --root=${pkgdir} || return 1
}
