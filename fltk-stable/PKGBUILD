# Maintainer: YL3GDY <yl3gdy at archlinux dot us>

pkgname=fltk-stable
pkgver=1.1.10
pkgrel=2
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.fltk.org/"
depends=('sh' 'libjpeg' 'libpng14' 'libxft' 'libxinerama' 'alsa-lib' 'hicolor-icon-theme' 'desktop-file-utils' 'xdg-utils')
makedepends=('mesa' 'doxygen')
conflicts=('fltk')
provides=('fltk=1.1.10 fltk-docs=1.1.10')
source=(http://ftp.easysw.com/pub/fltk/$pkgver/fltk-$pkgver-source.tar.gz)
install=fltk.install
md5sums=('e6378a76ca1ef073bcb092df1ef3ba55')

pkgdesc="Graphical user interface toolkit for X. Stable 1.1.x branch (with documentation)"

build() {
  cd "$srcdir/fltk-$pkgver"
  sed -i 's|# *include *<png.h>|#include <libpng14/png.h>|' \
         CMake/PlatformTests.cxx \
         configure \
         fluid/fluid.cxx \
         png/libpng.3 \
         png/libpngpf.3 \
         src/Fl_PNG_Image.cxx

  ./configure --prefix=/usr --enable-threads --enable-xft --enable-shared
  make LDFLAGS="-lfontconfig $LDFLAGS"
  cd documentation
  make alldocs
}

package() {
  cd "$srcdir/fltk-$pkgver"
  make DESTDIR="$pkgdir" install install-desktop
  chmod 644 "$pkgdir"/usr/lib/*.a
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install documentation
  cd "$srcdir/fltk-$pkgver/documentation"
  install -d "$pkgdir"/usr/share/doc/fltk/
  cd ../test
  make DESTDIR="$pkgdir" install
}
