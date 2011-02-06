# Maintainer: Dan 'ProgDan' Vratil <progdan@progdansoft.com>
pkgname=netgo_ng
pkgver=0.2.1
pkgrel=1
pkgdesc="New generation of netgo tool espacially for those, who need to set up their computer for different network environments"
arch=(i686 x86_64)
url="http://www.kde-apps.org/content/show.php/netgo_ng?content=88232"
license=("GPL")
depends=('qt')
source=(http://www.linux-specialist.com/download/soucre/netgo_ng-$pkgver.tar.gz)
md5sums=('a78604a5561dcf043f96061d7678f621')


build() {
  cd $startdir/src/$pkgname-$pkgver
  # Enable following line if you are compiling on KDE 4.x
   ./configure --prefix=/usr --without-arts
  #./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
