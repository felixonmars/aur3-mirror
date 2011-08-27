pkgname=tktimer
pkgver=0.1
pkgrel=1
pkgdesc="Timer pates !"
url="http://trizo.chocakai.org"
arch=('i686' 'x86_64')
depends=('gtk2')
source=("http://trizo.chocakai.org/upload/Prog/$pkgname-$pkgver.tar.bz2")
md5sums=('14492c89b0becbf528c6bec27f88a246')
license="GPL"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make PREFIX=$startdir/pkg/usr DESTDIR=$startdir/pkg install
}
        
