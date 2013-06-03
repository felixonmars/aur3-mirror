# Contributor: Geoff Teale <tealeg@member.fsf.org>
_pkgname=odfpy
pkgname=${_pkgname}-svn
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
source=("${_pkgname}::svn+https://joinup.ec.europa.eu/svn/odfpy/trunk")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  svnversion | tr -d '[A-z]'
}

build() {
  cd "${srcdir}/${_pkgname}"

  python setup.py install --root=${pkgdir} || return 1
}
