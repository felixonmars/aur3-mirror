# Maintainer: Baraa Chiet

pkgname=prozgui-git
pkgver=2.0.7
pkgrel=3
pkgdesc="Prozgui the Download Accelerator for Linux."
arch=('any')
url="https://github.com/UVT/prozgui"
license=('GPL3')
depends=('fltk')
makedepends=('git')
options=(!libtool)
source=(git://github.com/UVT/prozgui.git)
md5sums=('SKIP')

prepare() {
  cd $srcdir/prozgui/
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/prozgui/
  make
}

package() {
  cd $srcdir/prozgui/
  make DESTDIR=$pkgdir install

  # Remove obsolete library header files  
  rm -rf $pkgdir/usr/include
}