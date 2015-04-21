# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=ingen-svn
pkgver=0.5.1.r5675
pkgrel=1
pkgdesc="A JACK modular audio processing system using LV2 or LADSPA plugins."
arch=('i686' 'x86_64')
url="http://drobilla.net/software/ingen"
license=('GPL3')
depends=('python2' 'gtkmm' 'lv2-git' 'lilv-svn' 'ganv-svn' 'suil-svn' 'jack')
makedepends=('subversion' 'boost' 'raul-svn' 'webkitgtk2')
optdepends=('webkitgtk2: for HTML plugin documentation support')
install="${pkgname}.install"
provides=("ingen")
conflicts=("ingen")

_svnname=ingen
source=("svn+http://svn.drobilla.net/lad/trunk/${_svnname}")
md5sums=('SKIP')

pkgver() {
  cd "${_svnname}"
  local rel=`grep "^INGEN_VERSION" wscript | cut -d "'" -f 2`
  local ver="$(svnversion)"
  printf "%s.r%s" "${rel}" "${ver//[[:alpha:]]}"
}

build() {
  cd "${_svnname}"

  # pick up python2 even when python3 exists
  # (the build system has flaky support for python3)
  export PYTHON="/usr/bin/python2"

  python2 waf configure --prefix=/usr \
                        --configdir=/etc

  python2 waf
}

package() {
  cd "${_svnname}"
  python2 waf install --destdir="${pkgdir}"
}
