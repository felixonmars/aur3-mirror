# Maintainer:
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=tapecalc
_pkgname=add
pkgver=20140105
pkgrel=1
pkgdesc="checkbook or expense-account balancing tool (known as add or tapecalc)"
arch=('i686' 'x86_64')
url="http://invisible-island.net/add/add.html"
license=('custom')
depends=('ncurses')
source=("http://invisible-island.net/datafiles/release/$_pkgname.tar.gz")
sha256sums=('f963eef1b513844b3acaff71684d3e26bb77731eaab3e053df3480f3c5d318bd')


build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr \
    --with-ncurses \
    --with-ncursesw #\
    #--program-transform-name=tapecalc # doesn't work like expected, the rename script is failing

  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -D COPYING $pkgdir/usr/share/licenses/tapecalc/LICENSE
}
