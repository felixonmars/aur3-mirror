# Contributor: mickele <mimocciola@yahoo.com>
pkgname=wxgtk-2.6-ansi
pkgver=2.6.4
pkgrel=1
pkgdesc="wxGTK - GTK+ implementation of wxWidgets API for GUI - ANSI version (no unicode)"
arch=(i686 x86_64)
license=('LGPL')
depends=('wxgtk-2.6')
replaces=()
conflicts=()
provides=()
source=(http://downloads.sourceforge.net/wxwindows/wxGTK-${pkgver}.tar.bz2
	wxgtk-borderfree.patch)
url="http://wxwidgets.org"

build() {
  cd ${srcdir}/wxGTK-${pkgver}
  patch -Np0 -i ${startdir}/src/wxgtk-borderfree.patch || return 1
  ./configure --prefix=/usr \
              --with-gtk=2 \
              --with-opengl \
              --without-gnomeprint \
              --enable-optimize || return 1
  make || return 1
  make -C locale allmo
  make DESTDIR=${startdir}/pkg install || return 1
  cd contrib/src
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  rm -rf ${pkgdir}/usr/share
  rm -rf ${pkgdir}/usr/include
  rm -rf ${pkgdir}/usr/bin
}
md5sums=('ce0fd2b425bc98957cf70eea5f154b49'
         'cffc3739d315e7d78299bd75f25ff5c4')
