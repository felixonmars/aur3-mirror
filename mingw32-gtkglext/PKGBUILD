# Contributor: Rich Lane <rlane@club.cc.cmu.edu>
# Based on PKGBUILD by: Ben <ben@benmazer.net>

pkgname=mingw32-gtkglext
pkgver=1.2.0
pkgrel=1
pkgdesc="opengl extensions for gtk2"
arch=('i686' 'x86_64')
url="http://gtkglext.sourceforge.net/"
license=('LGPL')
depends=()
makedepends=('gcc' 'mingw32-gtk2')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/gtkglext/gtkglext-${pkgver}.tar.bz2"
	gtk2.20.patch gtkglext-1.0.6-pangox.patch)
md5sums=('ed7ba24ce06a8630c07f2d0ee5f04ab4'
         'e5a87ec3f2d0e616c6f32f90c3f7237f'
				 '7e35925b3c722717f969558cc627f39f')

build() {
	unset LDFLAGS
  cd ${srcdir}/gtkglext-${pkgver}
  patch -Np1 -i ${srcdir}/gtk2.20.patch || return 1
	patch -p1 -R -i ${srcdir}/gtkglext-1.0.6-pangox.patch || return 1
  autoconf --force || return 1
	export PKG_CONFIG_PATH="/usr/i486-mingw32/lib/pkgconfig/"
  ./configure --host=i486-mingw32 --prefix=/usr/i486-mingw32 --with-gdktarget=win32 --without-x || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
