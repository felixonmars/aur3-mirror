# Maintainer: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>

pkgname=gedit-macro-plugin
pkgver=1.2
pkgrel=1
pkgdesc="Macro plugin for gEdit"
url="http://code.google.com/p/gedit-macro-plugin/"
license=("GPL3")
arch=('i686' 'x86_64')
depends=('gedit')
source=(${pkgname}-${pkgver}.rev5.tar.gz
        dup-keys-fix.patch)
md5sums=('fc764261971b63c8be48427c717d7b63'
         '3d632ff33167c39e8b0e5137a0de81ab')

build() {
  cd ${srcdir}/${pkgname}/src
  patch -Np1 -i ../../dup-keys-fix.patch || return 1
  sed -i "s|#include <glib|#define GETTEXT_PACKAGE \"gtk20\"\n#include <glib|" gedit-macro-plugin.c
  sed -i "s|_||g" macro.gedit-plugin.desktop.in
  gcc `pkg-config --cflags --libs gedit-2.20` -shared -fpic gedit-macro-plugin.c -o libmacro.so
}

package() {  
  cd ${srcdir}/${pkgname}/src
  install -dm755 ${pkgdir}/usr/lib/gedit-2/plugins
  install -Dm644 libmacro.so  ${pkgdir}/usr/lib/gedit-2/plugins
  install -m644 macro.gedit-plugin.desktop.in  ${pkgdir}/usr/lib/gedit-2/plugins/macro.gedit-plugin
}
