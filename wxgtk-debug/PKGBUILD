# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=wxgtk-debug
pkgver=2.8.12
pkgrel=1
pkgdesc="GTK+ implementation of wxWidgets API for GUI - debug mode (devel)"
arch=('i686' 'x86_64')
url="http://wxwidgets.org"
license=('custom:wxWindows')
depends=('wxgtk')
makedepends=('libgnomeprintui' 'gstreamer0.10-base-plugins' 'gconf' 'mesa')
#source=("http://downloads.sourceforge.net/wxpython/wxPython-src-${pkgver}.tar.bz2")
source=(http://downloads.sourceforge.net/wxwindows/wxGTK-${pkgver}.tar.bz2)
md5sums=('08f81ab60647308058f6ce99712b14f8')

build() {
#  cd "${srcdir}/wxPython-src-${pkgver}"
  cd "${srcdir}/wxGTK-${pkgver}"
  
  ./configure --prefix=/usr --libdir=/usr/lib --with-gtk=2 --with-opengl --enable-unicode \
    --enable-graphics_ctx --with-gnomeprint --disable-optimize --enable-mediactrl \
    --with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys \
    --enable-debug
  make
  make -C locale allmo
  cd contrib/src
  make
}

package() {
  cd "${srcdir}/wxGTK-${pkgver}"
  make DESTDIR="${pkgdir}" install
  cd contrib/src
  make DESTDIR="${pkgdir}" install
  msg "Removing files already present in wxgtk package..."
  rm -fr "${pkgdir}/usr/share" &>/dev/null
  rm -fr "${pkgdir}/usr/include" &>/dev/null
  rm -fr "${pkgdir}/usr/bin" &>/dev/null
  install -D -m644 ../../docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
