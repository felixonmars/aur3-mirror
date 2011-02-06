# Maintainer: Vivien Schilis <vivien.schilis@sf.net>
# Contributor: Jérémie Bernard, Michael Aubertin, Schilis Vivien

pkgname=libgenerics
pkgver=1.2.1 
pkgrel=1
pkgdesc="C++ meta object runtime analyse and archiving"
arch=(i686 x86_64)
url="http://libgenerics.sourceforge.net"
license=('GPL')
depends=('libxml2' )
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
#source=(http://$mirror.dl.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('aaba3ae1a18560dc4d52a00597bb8c3a')
 
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
