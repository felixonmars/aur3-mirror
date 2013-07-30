# Contributor: Prurigro
# Maintainer: Mathew Velasquez <01100101z@gmail.com>
pkgname=gimx-svn
pkgver=1462  
pkgrel=2
pkgdesc="A tool designed to control video game consoles from a PC"
arch=('i686' 'x86_64')
url="http://code.google.com/p/diyps3controller/"
license=('GPL')
depends=('ncurses' 'wxgtk' 'sdl' 'bluez-libs' 'libusb-compat')
optdepends=('bluez4: bluetooth support')
makedepends=('subversion')
provides=('gimx')
source=('svn+http://diyps3controller.googlecode.com/svn/trunk/GIMX' 'patch')
md5sums=('SKIP'
         '0e79016640f89b5d70364198d38c697f')

pkgver() {
  cd "$srcdir/GIMX"
  svnversion | tr -d [A-z]
}

build() {
  cd "$srcdir"
  patch -p1 < patch
  cd GIMX
  make || return 1
}

package() {
  cd "$srcdir/GIMX"
  make DESTDIR="$pkgdir" install
}

