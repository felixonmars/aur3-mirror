# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=multivnc
pkgver=0.5
pkgrel=1
pkgdesc="A cross-platform Multicast-enabled VNC viewer using wxWidgets and libvncclient ."
arch=(i686 x86_64)
url="http://multivnc.sourceforge.net/"
license=('GPL')
depends=('wxgtk' 'libjpeg-turbo')
conflicts=("$pkgname-git")
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/multivnc/$pkgver/$pkgname-$pkgver.tar.gz"
        "toggle-keyboard-grab.png.h"
        "toggle-keyboard-grab.png")
md5sums=('7a2e45f045ea3fbbe4babdf9f2dc0920'
         '82c14f48042620296bfaf4ad47cddbe6'
         '9f8e71699cf5da5c88551a2003f24318')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # placing missing files
  cp ../*.png* src/gui/res

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
