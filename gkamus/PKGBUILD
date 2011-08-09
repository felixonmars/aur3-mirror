#Author: Ardhan Madras <ajhwb@knac.com>
#Author: Firmansyah <leonard_gimsong@yahoo.com>
# Maintainer: Yuginta <cowoplinplan@gmail.com>
pkgname=gkamus
pkgver=1.0
pkgrel=1
pkgdesc="Indonesian-English Dictionary"
arch=('i686 x86_64')
url="http://gkamus.sourceforge.net/"
license=('GPLv2')
depends=('gtk2')
source=(http://nchc.dl.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('c31bb006eeeb5f3ddcb638cbef94a955')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	
	  ./configure --prefix=/usr
	  
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
