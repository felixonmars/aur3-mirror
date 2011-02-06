# Maintainer: Hilton Medeiros <medeiros.hilton at gmail dot com>

pkgname=gdb-stl-views
_pkgname=dbinit_stl_views
pkgver=1.03
pkgrel=1
pkgdesc="A set of GDB macros that can display the contents of many C++ STL containers"
arch=('i686' 'x86_64')
url="http://sourceware.org/gdb/wiki/STLSupport"
license=('GPL')
depends=('gdb')
install=gdb-stl-views.install
source=("http://www.yolinux.com/TUTORIALS/src/$_pkgname-$pkgver.txt")
md5sums=('860bd6fc568fc922bfcf47ecba83455a')

build() {
  /bin/true
}

package() {
  cd "$srcdir"
  install -Dm644 $_pkgname-$pkgver.txt $pkgdir/usr/share/gdb/$pkgname/$pkgname.gdb
}
