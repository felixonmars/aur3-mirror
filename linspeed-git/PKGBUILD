# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=linspeed-git
pkgver=r102.a6d94e3
pkgrel=1
pkgdesc="Gui Tool to Test Internet Speed on Linux Desktop."
arch=('i686' 'x86_64')
url="http://linoxide.com/linspeed/"
license=('GPL3')
depends=('qtwebkit')
source=('git+https://github.com/Linoxide/linspeed.git')
md5sums=('SKIP')

pkgver() {
  cd linspeed
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/linspeed
  qmake-qt4

  # Fix desktop icon path
  sed -i 's|icons|pixmaps|' linspeed.desktop
}

build() {
  cd $srcdir/linspeed
  make
}

package() {
  cd $srcdir/linspeed

  # Binary
  install -Dm755 linspeed $pkgdir/usr/bin/linspeed

  # Desktop icon
  install -Dm644 linspeed.svg $pkgdir/usr/share/pixmaps/linspeed.svg
  install -Dm644 linspeed.desktop $pkgdir/usr/share/applications/linspeed.desktop
}
