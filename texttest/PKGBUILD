pkgname=texttest
pkgver=3.21
pkgrel=7
pkgdesc="TextTest is an application-independent tool for text-based functional testing"
arch=(any)
url="http://texttest.carmen.se/index.php?page=main"
license=('LGPL')
depends=(python2 pygtk tkdiff)
backup=()
noextract=()
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.zip
        texttest)
md5sums=('60cb48ca0490da3d19b3584abe5be006'
         '0edfd933331e344233a755d60bf6c2e6')

build() {
  cd "$srcdir"
  install -d -m0755 $pkgdir/usr/share
  mv $pkgname-$pkgver $pkgdir/usr/share/$pkgname || return 1
  install -D -m0755 $pkgname $pkgdir/usr/bin/$pkgname
}
