# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=wxgtk2.8-ansi
pkgver=2.8.12
pkgrel=1
pkgdesc="GTK+ implementation of wxWidgets API for GUI - ANSI version (no unicode)"
arch=('i686' 'x86_64')
url="http://wxwidgets.org"
license=('custom:wxWindows')
depends=('wxgtk')
makedepends=('libgnomeprintui' 'gstreamer0.10-base-plugins' 'gconf' 'mesa')
source=(http://downloads.sourceforge.net/wxwindows/wxGTK-${pkgver}.tar.bz2)
md5sums=('08f81ab60647308058f6ce99712b14f8')

build() {
  cd "${srcdir}/wxGTK-${pkgver}"
  ./configure --enable-ansi --disable-unicode --with-opengl \
        --prefix=/usr --libdir=/usr/lib --with-gtk=2 \
		--enable-graphics_ctx --with-gnomeprint --disable-optimize --enable-mediactrl \
		--with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys
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
  install -D -m644 ../../docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -fr "${pkgdir}/usr/bin" &>/dev/null
  rm -fr "${pkgdir}/usr/include" &>/dev/null
}