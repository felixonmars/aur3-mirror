# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=wxgtk3.0-light
pkgver=3.0.0
_pkgver=3.0.0
pkgrel=2
pkgdesc="GTK+ implementation of wxWidgets API for GUI (GNOME/GStreamer free!)"
arch=('i686' 'x86_64')
url="http://wxwidgets.org"
license=('custom:wxWindows')
depends=('gtk2' 'libgl' 'libxxf86vm' 'libsm' 'sdl')
makedepends=('mesa' 'glu' 'libxt')
provides=('wxgtk3.0=3.0.0')
conflicts=('wxgtk3.0')
source=("http://downloads.sourceforge.net/wxwindows/wxWidgets-${_pkgver}.tar.bz2"
        "wxGTK-3.0.0-collision.patch")
sha1sums=('756a9c54d1f411e262f03bacb78ccef085a9880a'
          'be3c6a6c252b2d7c09634eec7962683b9ebc5b61')

prepare() {
  rm -fr "${srcdir}/wxWidgets-build"
  cp -R "${srcdir}/wxWidgets-${_pkgver}" "${srcdir}/wxWidgets-build"
  cd "${srcdir}/wxWidgets-build"

  patch -p1 -i "${srcdir}/wxGTK-3.0.0-collision.patch"
}

build() {
  cd "${srcdir}/wxWidgets-build"
  ./configure --prefix=/usr --libdir=/usr/lib --with-{gtk=2,libjpeg=sys,libpng=sys,libtiff=sys,libxpm=sys,opengl,regex=builtin,sdl} --enable-{graphics_ctx,unicode} --disable-{mediactrl,precomp-headers}
  make
  make -C locale allmo
}

package() {
  cd "${srcdir}/wxWidgets-build"
  make DESTDIR="${pkgdir}" install
  install -D -m644 docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
