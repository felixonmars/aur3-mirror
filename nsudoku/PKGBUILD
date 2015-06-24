pkgname=nsudoku
pkgver=1.3
pkgrel=1
pkgdesc="The Sudoku puzzle game in ncurses"
arch=(i686 x86_64)
url="https://www.tbmatuka.com/nsudoku/"
license=('MIT')
depends=('ncurses')
source=(http://www.tbmatuka.com/$pkgname/$pkgname-$pkgver.c
        http://www.tbmatuka.com/$pkgname/LICENSE-$pkgver)

md5sums=('cae8ddb55879427631d995a2e6b16e55'
         '9db7d0019667301f05d66f9418d8bf6e')

build() {
  cd "$srcdir"

  gcc -o $pkgname $pkgname-$pkgver.c -lncurses
}

package() {
  cd "$srcdir"
  
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE-$pkgver $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
