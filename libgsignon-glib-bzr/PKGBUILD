# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=libgsignon-glib-bzr
_pkgname=${pkgname%-*}
pkgver=265
pkgrel=1
pkgdesc='gSSO client library'
arch=('i686' 'x86_64')
url='https://01.org/gsso'
license=('LGPL2.1')
depends=('glib2')
makedepends=('bzr' 'gobject-introspection' 'gtk-doc')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "${pkgname-git}")
source=("${pkgname%-*}::bzr+lp:${pkgname%-*}")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  bzr revno
}

build() {
  cd ${pkgname%-*}

  ./autogen.sh --prefix=/usr --enable-dbus-type=session --enable-introspection=yes
  make
}

package() {
  cd ${pkgname%-*}

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
