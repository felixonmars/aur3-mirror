# Contributor: Víctor Martínez Romanos <vmromanos@gmail.com>
# [Victor]
# Server = http://personales.ya.com/vmromanos/arch/pkgs
pkgname=tuxcall
pkgver=0.5
pkgrel=2
pkgdesc="Detects voice calls and hangs up the modem dialup connection, allowing to answer phone"
depends=('gtk>=1.2.0')
url="http://tuxcall.sourceforge.net/"
license=("GPL")
arch=('i686')
source=(http://dl.sourceforge.net/sourceforge/tuxcall/$pkgname-$pkgver.tar.gz) 
md5sums=('80220fbd2aa7d59f65f0369aed7cee75')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-debug
  make || return 1
  make DESTDIR=$startdir/pkg install
}
