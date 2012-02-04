# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgbase=poppler
# AUR doesn't like the multi-package thing
#pkgname=('mingw32-poppler' 'mingw32-poppler-glib')
pkgname='mingw32-poppler'
pkgver=0.14.3
pkgrel=1
arch=('any')
depends=('mingw32-runtime' 'mingw32-libjpeg' 'mingw32-cairo' 'mingw32-libxml2'
         'mingw32-fontconfig' 'mingw32-gtk2' 'mingw32-lcms')
makedepends=('mingw32-gcc')
options=('!libtool')
license=('GPL')
url="http://poppler.freedesktop.org/"
source=(http://poppler.freedesktop.org/${pkgbase}-${pkgver}.tar.gz
        mingw32-poppler-fixes.patch)
md5sums=('1024c608a8a7c1d6ec301bddf11f3af9'
         '6f683ba28e6b6608dd11d88ed48e8bca')

build() {
  cd "$srcdir/$pkgbase-$pkgver"

  export CFLAGS="-O2 -mms-bitfields"
  export CXXFLAGS="-O2 -mms-bitfields"
  export PKG_CONFIG_PATH="/usr/i486-mingw32/lib/pkgconfig/"
  unset LDFLAGS # mingw-ld chokes on --hash-style=gnu

  patch -Np2 -i $startdir/mingw32-poppler-fixes.patch

  ./configure \
      --prefix=/usr/i486-mingw32 \
      --host=i486-mingw32 \
      --build=$CHOST \
      --enable-cairo-output \
      --disable-abiword-output \
      --enable-xpdf-headers \
      --enable-libjpeg \
      --disable-zlib \
      --enable-poppler-glib \
      --disable-poppler-qt \
      --disable-poppler-qt4 \
      --disable-utils

    make
}

package_mingw32-poppler() {
  depends=('mingw32-runtime' 'mingw32-libjpeg' 'mingw32-cairo' 'mingw32-libxml2'
           'mingw32-fontconfig' 'mingw32-lcms')
  pkgdesc="PDF rendering library based on xpdf 3.0 (mingw32)"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/i486-mingw32/include/poppler/{glib,qt4}
  rm -f "${pkgdir}"/usr/i486-mingw32/bin/libpoppler-{glib,qt4}-*.dll
  rm -f "${pkgdir}"/usr/i486-mingw32/lib/libpoppler-{glib,qt4}{.dll,}.a
  rm -f "${pkgdir}"/usr/i486-mingw32/lib/pkgconfig/poppler-{glib,qt4}.pc
  rm -rf "${pkgdir}/usr/i486-mingw32/share/gtk-doc"
}

package_mingw32-poppler-glib() {
  pkgdesc="Poppler glib bindings (mingw32)"
  depends=("mingw32-poppler=${pkgver}" 'mingw32-gtk2')

  cd "${srcdir}/${pkgbase}-${pkgver}/poppler"
  make DESTDIR="${pkgdir}" install-libLTLIBRARIES
  cd "${srcdir}/${pkgbase}-${pkgver}/glib"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/i486-mingw32/lib/pkgconfig"
  install -m644 ../poppler-glib.pc "${pkgdir}/usr/i486-mingw32/lib/pkgconfig/"
  rm -f "${pkgdir}"/usr/i486-mingw32/lib/libpoppler.*
  rm -f "${pkgdir}"/usr/i486-mingw32/bin/libpoppler-*.dll
}

# vim:set ts=2 sw=2 et:
