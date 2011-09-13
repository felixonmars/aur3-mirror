# Maintainer: phancius <phancius@gmail.com>

pkgname=poppler-zh
pkgver=0.16.7
pkgrel=2
arch=(i686 x86_64)
license=('GPL')
makedepends=('libjpeg' 'gcc-libs' 'cairo' 'libxml2' 'fontconfig' 'openjpeg' 'gtk2' 'qt' 'pkgconfig' 'lcms' 'gobject-introspection')
options=('!libtool')
url="http://poppler.freedesktop.org/"
source=(http://poppler.freedesktop.org/poppler-${pkgver}.tar.gz fc-lang-zh-pdf.patch)
md5sums=('3afa28e3c8c4f06b0fbca3c91e06394e' '8d54a1ef2b18758d92cd38109e46a4da')

build() {
  cd "${srcdir}/poppler-${pkgver}"
  patch -Np1 -i ${srcdir}/fc-lang-zh-pdf.patch
  sed -i -e '/AC_PATH_XTRA/d' configure.ac
  autoreconf
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --enable-cairo-output \
      --enable-xpdf-headers \
      --enable-libjpeg --enable-zlib \
      --enable-poppler-qt4 \
      --enable-poppler-glib
  make
}

package() {
  pkgname=poppler-zh
  pkgdesc="poppler patched for chinese fontconfig matching"
  depends=('libjpeg' 'gcc-libs' 'cairo' 'libxml2' 'fontconfig' 'openjpeg' 'lcms' 'poppler-data')
  provides=('poppler=0.16.7')
  conflicts=('poppler')

  cd "${srcdir}/poppler-${pkgver}"
  sed -e 's/^glib_subdir =.*/glib_subdir =/' \
      -e 's/^qt4_subdir =.*/qt4_subdir =/' -i Makefile
  make DESTDIR="${pkgdir}" install

  rm -f "${pkgdir}"/usr/lib/pkgconfig/poppler-{glib,qt4}.pc
}

