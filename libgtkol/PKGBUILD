# Maintainer: Vivien Schilis <vivien.schilis@sf.net>
# Contributor: Jérémie Bernard, Michael Aubertin, Schilis Vivien

pkgname=libgtkol
pkgver=1.4.1
pkgrel=1
pkgdesc="Gtk c++ object layer"
arch=(i686 x86_64)
url="http://libgtkol.sourceforge.net"
license=('GPL')
depends=('libgenerics' )
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f8b7acc0fcd9da0a3931dc14d7d262ae')
 
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr 
  make || return 1
  make prefix=$startdir/pkg/usr install
}
