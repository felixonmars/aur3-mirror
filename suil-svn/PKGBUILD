# Maintainer: prettyvanilla <prettyvanilla@posteo.at>

pkgname=suil-svn
pkgver=0.8.3.r5675
pkgrel=1
pkgdesc="A lightweight C library for loading and wrapping LV2 plugin UIs"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/suil/"
license=('custom:ISC')
makedepends=('subversion' 'python2' 'lv2-git' 'qt4' 'gtk2')
optdepends=('qt4: Qt 4.x UI wrapping support'
            'gtk2: GTK+ 2.x UI wrapping support')
provides=("suil")
conflicts=("suil")

_svnname=suil
source=("svn+http://svn.drobilla.net/lad/trunk/${_svnname}")
md5sums=('SKIP')

pkgver() {
  cd "${_svnname}"
  local rel=`grep "^SUIL_VERSION" wscript | cut -d "'" -f 2`
  local ver="$(svnversion)"
  printf "%s.r%s" "${rel}" "${ver//[[:alpha:]]}"
}

build() {
  cd "${_svnname}"
  python2 waf configure --prefix=/usr \
                        --configdir=/etc
  python2 waf
}

package() {
  cd "${_svnname}"
  python2 waf install --destdir="${pkgdir}"

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_svnname}/LICENSE"
}
