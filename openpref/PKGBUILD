pkgname=openpref
pkgver=0.1.3
pkgrel=1
pkgdesc="Preferans -- quite old European card game mostly popular in Russia"
arch=('i686' 'x86_64')
url="http://openpref.sourceforge.net/"
license=('GPL')
depends=('qt' )
makedepends=('cmake>=2.4.8')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('7b51607c2145f0063f405e159c6410bf')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir build
  # quick and dirty patch
  cp CMakeLists.txt CMakeLists.txt.orig
  sed 's/games/bin/g' < CMakeLists.txt.orig > CMakeLists.txt
  # 
  cd build
  cmake -D CMAKE_INSTALL_PREFIX="/usr" .. 
  make || return 1
  make DESTDIR="${pkgdir}" install
}
