# $Id$
# Maintainer: Realex
# Based on muffin PKGBUILD

_pkgname=muffin
pkgname=${_pkgname}-dev
pkgver=525.a9a68ed
pkgrel=1
pkgdesc="A window manager for GNOME"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/muffin"
license=('GPL')
depends=('clutter' 'gobject-introspection' 'cinnamon-desktop-dev' 'libcanberra'
         'startup-notification' 'zenity' 'dconf')
makedepends=('intltool' 'gnome-doc-utils' 'gnome-common' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!emptydirs')
install=${pkgname}.install
source=("git+https://github.com/linuxmint/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/${_pkgname}"
  PYTHON=python2 ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/muffin \
  				 			 --localstatedir=/var --disable-static --disable-schemas-compile \
                 --enable-compile-warnings=minimum
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
