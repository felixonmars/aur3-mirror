pkgname=makinbakon  
pkgver=0.4.0
pkgrel=1 
pkgdesc="Makin' Bakon is a typing tutor game written in C++ with an nCurses user interface for use in a unix/linux terminal window."
url="http://www.compunerdum.com/software.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=(fortune-mod ncurses)
makedepends=()
conflicts=()
replaces=()
backup=() 
install=
source=(http://www.compunerdum.com/src/$pkgname-$pkgver.tar.gz gcc-4.5.patch)
md5sums=('b22b26539a8fd3d4ed75c82224ce5d7b'
         'b0e690740fb7f8a97a174d7d81b83127')
build() { 
  mkdir -p $pkgdir/usr/bin
  cd $startdir/src/$pkgname-$pkgver
  patch -p1 < $startdir/src/gcc-4.5.patch
  make || return 1
  make PREFIX=$pkgdir/usr BAKONDIR=$pkgdir/usr/share/makinbakon install
}
