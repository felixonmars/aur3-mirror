# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=raul-svn
pkgver=0.8.6.r5675
pkgrel=1
pkgdesc="C++ Realtime Audio Utility Library."
arch=('any')
url="http://drobilla.net/software/raul/"
license=('GPL')
makedepends=('subversion' 'python2')
provides=('raul')
conflicts=('raul')

_svnname=raul
source=("svn+http://svn.drobilla.net/lad/trunk/${_svnname}")
md5sums=('SKIP')

pkgver() {
  cd "${_svnname}"
  local rel=`grep "^RAUL_VERSION" wscript | cut -d "'" -f 2`
  local ver="$(svnversion)"
  printf "%s.r%s" "${rel}" "${ver//[[:alpha:]]}"
}

build() {
  cd "${_svnname}"
  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd "${_svnname}"
  python2 waf install --destdir="${pkgdir}"
}
