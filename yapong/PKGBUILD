# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=yapong
pkgver=0.02
pkgrel=2
pkgdesc="Yet another pong clone"
arch=('i686' 'x86_64')
url="http://dev.yorhel.nl/dump"
license=('MIT')
depends=('ncurses')
source=(http://dev.yorhel.nl/download/code/$pkgname.c
        COPYING)
md5sums=('57b05f72ddb81bad4ab5f6be5aa6540d'
         '4edf0e03f869eaaf9ffd0faf23d32e50')

build() {
  cd "$srcdir"
  gcc $pkgname.c -lncurses -o $pkgname $CFLAGS || return 1
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 ../COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
