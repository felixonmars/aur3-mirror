# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=ganv-svn
pkgver=1.5.3.r5675
pkgrel=1
pkgdesc="An interactive Gtkmm canvas widget for graph-based interfaces"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/ganv/"
license=('GPL3')
depends=( 'gtkmm' 'graphviz')
makedepends=('subversion' 'python2' 'gobject-introspection')
provides=("ganv")
conflicts=("ganv")

_svnname=ganv
source=("svn+http://svn.drobilla.net/lad/trunk/${_svnname}")
md5sums=('SKIP')

pkgver() {
  cd "${_svnname}"
  local rel=`grep "^GANV_VERSION" wscript | cut -d "'" -f 2`
  local ver="$(svnversion)"
  printf "%s.r%s" "${rel}" "${ver//[[:alpha:]]}"
}

build() {
  cd "${_svnname}"

  python2 waf configure --prefix=/usr \
                        --configdir=/etc \
                        --gir

  python2 waf
}

package() {
  cd "${_svnname}"
  python2 waf install --destdir="${pkgdir}"
}
