# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=lilv-svn
pkgver=0.21.3.r5675
pkgrel=1
pkgdesc="A C library interface to the LV2 plug-in standard"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/lilv"
license=("custom:ISC")
depends=('lv2-git' 'sratom-svn' 'serd-svn' 'sord-svn' 'python2-numpy')
makedepends=('subversion' 'swig')
optdepends=("bash-completion: auto-complete words")
provides=("lilv")
conflicts=("lilv")

_svnname=lilv
source=("svn+http://svn.drobilla.net/lad/trunk/${_svnname}")
md5sums=('SKIP')

pkgver() {
  cd "${_svnname}"
  local rel=`grep "^LILV_VERSION" wscript | cut -d "'" -f 2`
  local ver="$(svnversion)"
  printf "%s.r%s" "${rel}" "${ver//[[:alpha:]]}"
}

build() {
  cd "${_svnname}"

  # pick up python2 even when python3 exists
  # (the build system has flaky support for python3)
  export PYTHON="/usr/bin/python2"

  python2 waf configure --prefix=/usr \
                        --configdir=/etc \
                        --dyn-manifest \
                        --bindings

  python2 waf
}

package() {
  cd "${_svnname}"

  python2 waf install --destdir="${pkgdir}"

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
