# Maintainer: Jove Yu <yushijun110 [AT] gmail.com >

pkgname=nautilus-gksu
_pkgname=gksu
pkgver=2.0.2
pkgrel=3
pkgdesc="privilege granting extension for nautilus using gksu"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gksu/index.html"
license=('GPL')
depends=('libgksu>=2.0.12' 'xorg-xauth')
makedepends=('gtk-doc' 'intltool')
options=('!libtool')
source=("http://people.debian.org/~kov/gksu/${_pkgname}-${pkgver}.tar.gz"
        "99_intltool.patch")
md5sums=('cacbcac3fc272dce01c6ea38354489e2'
         '586e03fc02a6eeee250a60d6841597cb')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i -e 's|/usr/bin/x-terminal-emulator|-l gnome-terminal|g' gksu.desktop
  echo "TryExec=gnome-terminal" >> gksu.desktop
  
  # fix translate bug
  patch -p1 -i "${srcdir}/99_intltool.patch"
  
  # fix nautilus-gksu
  cd "${srcdir}/${_pkgname}-${pkgver}/nautilus-gksu"
  sed -i 's_#include <glib/gkeyfile.h>$_ _' *.c
  
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static 
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  
  # remove files for gksu
  rm -r "${pkgdir}/usr/bin/"
  rm -r "${pkgdir}/usr/share/gksu"
  rm -r "${pkgdir}/usr/share/man"
  rm -r "${pkgdir}/usr/share/pixmaps"
  rm -r "${pkgdir}/usr/share/applications"
  
  # move to right place
  mkdir "${pkgdir}/usr/lib/nautilus/extensions-3.0/"
  cp "${pkgdir}/usr/lib/nautilus/extensions-2.0/libnautilus-gksu.so" "${pkgdir}/usr/lib/nautilus/extensions-3.0/"
  
}
