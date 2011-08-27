# Contributor: Eduard "bekks" Warkentin <eduard.warkentin@gmail.com>
pkgname=poker-network
pkgver=1.0.37
pkgrel=1
pkgdesc="poker-network is a python library that implements a poker game (server and client)"
arch=('i686')
url="http://gna.org/projects/pokersource"
license="GPL"
depends=(automake pkgconfig python-soappy mysql-python pygtk pygtk twisted glade glib poker-engine pypoker-eval rsync)
source=(http://download.gna.org/pokersource/sources/$pkgname-$pkgver.tar.gz)
md5sums=('346c0a4abbe468ef12978245084924b7')

build() {
 cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
