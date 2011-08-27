# Maintainer: Joe Amenta <amentajo@msu.edu>
# Original Maintainer: Eric Belanger <eric@archlinux.org>
# Original Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# New Version - Contributor: Bob Finch <w9ya@arrl.net>
# with help from J. Santiago Hirschfeld <jsantiagoh@yahoo.com.ar> aka Angelus

pkgname=wxgtk-gcc43
pkgver=2.8.11
pkgrel=1
pkgdesc="GTK+ implementation of wxWidgets API for GUI, compiled with gcc-4.3"
arch=('i686' 'x86_64')
url="http://wxwidgets.org"
license=('custom:wxWindows')
provides=('wxgtk=2.8.11-1')
conflicts=('wxgtk')
depends=('gtk2' 'gstreamer0.10-base' 'libgl')
makedepends=('gcc43' 'libgnomeprintui' 'gstreamer0.10-base-plugins' 'gconf' 'mesa')
#source=(http://downloads.sourceforge.net/wxpython/wxPython-src-${pkgver}.tar.bz2)
source=(http://downloads.sourceforge.net/wxwindows/wxGTK-${pkgver}.tar.bz2
	use-libdir.patch)
md5sums=('6040933d200037f90f6aa1c5169e7ec6'
         'fc91c92c10ac71892ef23b4698daedb9')

build() {
#  cd "${srcdir}/wxPython-src-${pkgver}"
  cd "${srcdir}/wxGTK-${pkgver}"
  LDFLAGS="${LDFLAGS//-Wl,--as-needed/}"
  patch -p1 < $srcdir/use-libdir.patch
  ./configure CC=gcc-4.3 CXX=g++-4.3 --prefix=/usr --libdir=/usr/lib --with-gtk=2 --with-opengl \
    --enable-unicode --enable-graphics_ctx --with-gnomeprint --disable-optimize --enable-mediactrl \
    --with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys || return 1
  make || return 1
  make -C locale allmo || return 1
  cd contrib/src
  make || return 1
}

package() {
  cd "${srcdir}/wxGTK-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
  cd contrib/src
  make DESTDIR="${pkgdir}" install || return 1
  install -D -m644 ../../docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
}
