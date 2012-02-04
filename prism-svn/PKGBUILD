# Maintainer: fauno <fauno@kiwwwi.com.ar>
# Based on xulrunner by
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=prism-svn
pkgver=1.0b4
_ffoxver=3.6.8
_xulver=1.9.2
pkgrel=2
pkgdesc="Prism is an application that lets users split web applications out of their browser and run them directly on their desktop."
arch=(i686 x86_64)
license=('MPL' 'GPL' 'LGPL')
depends=("xulrunner>=${_xulver}")
makedepends=('subversion')
optdepends=()
provides=('prism')
url="https://mozillalabs.com/prism/"
source=(http://releases.mozilla.org/pub/mozilla.org/firefox/releases/${_ffoxver}/source/firefox-${_ffoxver}.source.tar.bz2
        mozconfig)

_svnroot="http://svn.mozilla.org/projects/webrunner/trunk"
_svntrunk="prism"

build() {
  cd "${srcdir}/mozilla-${_xulver}"
  cp "${srcdir}/mozconfig" .mozconfig
  mkdir -p mozilla-obj/

  svn co $_svnroot $_svntrunk

  unset CFLAGS
  unset CXXFLAGS

  make -j1 -f client.mk build MOZ_MAKE_FLAGS="$MAKEFLAGS" || return 1
}

package() {
  cd ${srcdir}/mozilla-${_xulver}/mozilla-obj/prism/dist/bin

  install -dm755 ${pkgdir}/usr/{bin,lib/${_svntrunk}-${pkgver}}

  cp -rL {chrome,components,defaults,extensions,modules,nsinstall,prism,application.ini,run-mozilla.sh} ${pkgdir}/usr/lib/${_svntrunk}-${pkgver}/

  ln -s /usr/lib/${_svntrunk}-${pkgver}/prism ${pkgdir}/usr/bin/
}
md5sums=('0ee5f14fd8be07513d16131027ebcb61'
         '89f3e53b8a00b52fb9b0d78b5a1c55a1')
