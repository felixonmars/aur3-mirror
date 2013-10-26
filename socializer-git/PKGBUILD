# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=socializer-git
pkgver=46.ad298be
pkgrel=1
pkgdesc="Socializer is a windowed browser made specifically for better facebook experience."
url="http://anandbose.github.io/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt5-webkit' 'xdg-utils')
makedepends=('git')
source=('git+https://github.com/anandbose/socializer.git'
         socializer.desktop
         socializer-start)
md5sums=('SKIP'
         '2ed55dad0922272d99532b5b05a55a27'
         '1af44d9ce9f736c895568e93a89931ce')

prepare() {
  cd $srcdir/socializer  
  qmake-qt5
}

build() {
  cd $srcdir/socializer
  make
}

package() {
  cd $srcdir/socializer
  # Binary
  install -Dm755 Socializer $pkgdir/usr/share/socializer/socializer
  
  # Themes
  cp -r  Themes $pkgdir/usr/share/socializer

  # Man page
  install -Dm644 debian/usr/share/man/man1/socializer.1 $pkgdir/usr/share/man/man1/socializer.1
  
  # Desktop icon
  install -Dm644 debian/opt/Socializer/Socializer.png $pkgdir/usr/share/pixmaps/socializer.png
  cd ..
  install -Dm644 socializer.desktop $pkgdir/usr/share/applications/socializer.desktop
  
  # Start file
  install -Dm755 socializer-start $pkgdir/usr/bin/socializer
}

pkgver() {
  cd $srcdir/socializer
  echo $(git rev-list --count master).$(git rev-parse --short master)
}