# Maintainer: Vivien Schilis <vivien.schilis@sf.net>
# Contributor: Jérémie Bernard, Michael Aubertin, Schilis Vivien

pkgname=gtkol-ldap
pkgver=1.1.1
pkgrel=1
pkgdesc="Client GUI designed to manage OpenLDAP directories"
arch=(i686 x86_64)
url="http://gtkol-ldap.sourceforge.net"
license=('GPL')
depends=('libgtkol' )
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('23623e0f1132dd96fbb438afb9135ad7')
 
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr 
  make || return 1
  make prefix=$startdir/pkg/usr install
}
