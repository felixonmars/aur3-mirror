# $Id$
# Maintainer:
# Contributor: Jeffrey 'jf' Lim <jfs.world@gmail.com>

_pkgname=wmii
pkgname=${_pkgname}-nomouseresize
pkgver=3.9.2
pkgrel=2
pkgdesc='wmii with disabled window resizing via mouse'
arch=('i686' 'x86_64')
license=('MIT')
url="http://wmii.suckless.org/"
depends=('libxft' 'libxrandr' 'libxinerama' 'dash')
options=('!makeflags')
source=(http://dl.suckless.org/${_pkgname}/${_pkgname}+ixp-${pkgver}.tbz
	'fix-freetype-include.patch'
  'no-mouse-resize.patch')
md5sums=('3d480502b7b1e2a405d941df67f16bcf'
	'97febd4a1df80aa4afbd126de1f36496'
  '99f39bced2d7744d4bbb9c753a3c9fbe')

build() {
  cd ${srcdir}/${_pkgname}+ixp-${pkgver}

  patch -Np1 -i ${srcdir}/fix-freetype-include.patch
  patch -Np1 -i ${srcdir}/no-mouse-resize.patch

  sed -i 's|PREFIX = /usr/local|PREFIX = /usr|' config.mk
  sed -i 's|ETC = $(PREFIX)/etc|ETC = /etc|' config.mk
  sed -i 's# !=#!=#' mk/hdr.mk
  sed -i 's#env python#env python2#' alternative_wmiircs/python/wmiirc

  export MAKEFLAGS="-j1"
  make
}

package() {
  cd ${srcdir}/${_pkgname}+ixp-${pkgver}
  make DESTDIR=${pkgdir} install

  install -Dm644 debian/file/wmii.desktop ${pkgdir}/usr/share/xsessions/${_pkgname}.desktop

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${_pkgname}/LICENSE
}
