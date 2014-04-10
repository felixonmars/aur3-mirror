# Maintainer: Federico Di Pierro <nierro92@gmail.com> 

pkgname=ship_battle
pkgver=1.3
pkgrel=1
pkgdesc="Classic ship game written in C and ncurses. Destroy enemy ships!"
arch=(i686 x86_64)
license=('GPL3')
url="https://github.com/FedeDP/ship_game"
groups=('games')
depends=('ncurses')
source=("$pkgname.c" "makefile")
md5sums=('SKIP' 'SKIP')

build() {
  cd "$srcdir"
  make
}

package() {
  cd "$srcdir"
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
}
