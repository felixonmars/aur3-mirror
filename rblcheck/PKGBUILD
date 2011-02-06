# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=rblcheck
pkgver=1.5
pkgrel=2
pkgdesc="Perform lookups in RBL-styles services."
arch=(i686)
url="http://rblcheck.sourceforge.net/"
license=('GPL-2')
source=(http://downloads.sourceforge.net/sourceforge/rblcheck/$pkgname-$pkgver.tar.gz)
md5sums=('fb7ee9adc0e09eee9dda195f9b9e7ca4')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
