# Maintainer: Košava <kosava@archlinux.us>

pkgname=penguin-pills
pkgver=0.4.3
pkgrel=1
pkgdesc="A graphical interface for use with multiple linux command line anti-virus scanners."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/penguinpills/"
license=('GPL')
depends=('qt' 'boost')
source=(http://sourceforge.net/projects/penguinpills/files/penguinpills_0.4.3_src.tar.gz)
md5sums=('bfc602e1057904d29ade28590ff22fa1')
build() {
  cd "$srcdir/"
  qmake 
  make
}

package() {
  cd "$srcdir/"
  mkdir $pkgdir/usr/
  mkdir $pkgdir/usr/bin/
  mv penguin_pills $pkgdir/usr/bin/penguin-pills
}
