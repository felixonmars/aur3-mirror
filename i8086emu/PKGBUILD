# Contributor: Vinay S Shastry <vinayshastry@gmail.com>

pkgname=i8086emu
pkgver=0.9.2
pkgrel=4
pkgdesc="i8086emu is an cross-platform emulator for the Intel 8086 microprocessor with an ncurses and a GTK-2 interface."
arch=(i686 x86_64)
url="http://i8086emu.sourceforge.net/"
depends=('gtk2' 'ncurses')
makedepends=('pkgconfig')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/i8086emu/$pkgname-src-$pkgver.tar.gz)
md5sums=('09cf42640387b88e0189ee985f094131')

build() {
  cd $startdir/src/$pkgname-src-$pkgver
  [ $CARCH == "x86_64" ] && export CFLAGS="$CFLAGS -fPIC"
  ./configure --prefix=/usr --sysconfdir=/etc 
  make || return 1
  make DESTDIR=$startdir/pkg install

}

