# Maintainer: TDY <tdy@gmx.com>

pkgname=goco
pkgver=1.0
pkgrel=1
pkgdesc="A minimalistic Tcl/Tk front-end for GNU Go"
arch=('i686' 'x86_64')
url="http://stud4.tuwien.ac.at/~e0225855/"
license=('custom')
depends=('gnugo' 'tk')
source=(http://stud4.tuwien.ac.at/~e0225855/various/$pkgname.tcl
        LICENSE)
md5sums=('176e69d24dbfbac14b428e1a6ebe2cc3'
         'b12e3b211429d24ab4d683dfd507ef7c')

build() {
  cd "$srcdir"
  install -Dm755 $pkgname.tcl "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
