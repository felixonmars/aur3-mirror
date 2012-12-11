# Maintainer: lspci 

pkgname=fltk-rep
pkgver=1.3.2
pkgrel=5
pkgdesc="A replacement for fltk 1.3.1"
arch=('i686' 'x86_64')
license=('custom:LGPL')
url="http://www.fltk.org/"
makedepends=('mesa' 'doxygen' 'libjpeg' 'libpng' 'libxft' 'libxinerama' \
             'alsa-lib' 'desktop-file-utils')
conflicts=('fltk')
source=(http://ftp.easysw.com/pub/fltk/$pkgver/fltk-$pkgver-source.tar.gz)
md5sums=('9f7e707d4fb7a5a76f0f9b73ff70623d')

build() {
    export pkgname='fltk'
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e 's/$(LINKFLTK)/$(LINKSHARED)/' \
         -e 's/$(LINKFLTKIMG)/$(LINKSHARED)/' test/Makefile
  ./configure --prefix=/usr --enable-threads --enable-xft --enable-shared
  make
  cd documentation
  make html
}

package() {
    export pkgname='fltk'
  pkgdesc="Graphical user interface toolkit for X"
  depends=('libjpeg' 'libpng' 'libxft' 'libxinerama' 'hicolor-icon-theme' \
           'desktop-file-utils' 'xdg-utils')
  options=('!docs')
  install=fltk.install

  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  (cd fluid; make DESTDIR="$pkgdir" install install-linux)
  chmod 644 "$pkgdir"/usr/lib/*.a
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}



