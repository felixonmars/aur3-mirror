# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=rhost
pkgver=4
pkgrel=1
pkgdesc="Jack host for RHSP synths and effects."
arch=('i686' 'x86_64')
url="http://sites.google.com/site/rockhardbuns/rhsp"
license=('GPL' 'custom:public domain')
depends=('gtkmm' 'jack' 'libsigc++')
install=
source=(http://sites.google.com/site/rockhardbuns/rhsp/${pkgname}.tar.gz LICENSE)
md5sums=('03bf26511396f24298a2f8191b3d5988'
         'a346fc8e2df91ee41c00f2219db27ae2')

build() {
  cd "${srcdir}/${pkgname}"
  make config=release || return 1

  cd "${srcdir}/${pkgname}/bin/release"
  install -D rhost "${pkgdir}/usr/bin/rhost" || return 1
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licences/${pkgname}/LICENSE" || return 1
}

# vim:set ts=2 sw=2 et:
