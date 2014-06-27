# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gtk3-icon-browser-git
_pkgname="${pkgname/-git}"
pkgver=20140626
pkgrel=2
pkgdesc="An application that shows GTK+ icons from current theme"
arch=(i686 x86_64)
url="https://git.gnome.org/browse/gtk+/tree/demos/icon-browser"
license=(LGPL)
depends=(gtk3 glib2 desktop-file-utils)
install="${pkgname}.install"
_plaingit="https://git.gnome.org/browse/gtk+/plain/demos/icon-browser"
source=("${_plaingit}/app-menu.ui"
        "${_plaingit}/iconbrowser.gresource.xml"
        "${_plaingit}/iconbrowserapp.c"
        "${_plaingit}/iconbrowserapp.h"
        "${_plaingit}/iconbrowserwin.c"
        "${_plaingit}/iconbrowserwin.h"
        "${_plaingit}/main.c"
        "${_plaingit}/window.ui"
        "${pkgname}.desktop")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '4098b28af562e5ebf2eb608c72847999')

pkgver() {
  date +%Y%m%d
}

build() {
  cd "${srcdir}"
  glib-compile-resources ./iconbrowser.gresource.xml --target=resources.c --sourcedir=. --generate-source
  gcc *.c *.h $(pkg-config --libs --cflags gtk+-3.0) -I . -o ${_pkgname}
}

package() {
  cd "${srcdir}"
  install -m 755 -D "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -m 755 -D "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

