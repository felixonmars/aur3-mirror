# Maintainer: Laszlo Papp <djszapi @ archlinux us>
pkgname=lcurses
pkgver=0.2
pkgrel=1
pkgdesc="LUA modules for ncurses, includes cui (curses UI)"
arch=('i686' 'x86_64')
url="http://www.t2-project.org/packages/lua-curses.html"
license=('GPL')
depends=('ncurses')
source=(http://home.xnet.com/~ansible/lua/$pkgname-$pkgver.zip)
md5sums=('ab0936aa8f1c31a5b4fa5354604f9ce6')

build() {
  cd "$srcdir"
  make || return 1
  install -m755 -D lcurses.so $pkgdir/usr/lib/lua/5.1/lcurses.so || return 1

}

