# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>
pkgname=aggregate
pkgver=1.0.2
pkgrel=2
pkgdesc="aggregate is a tool for aggregating IPv4 CIDR networks"
url="http://www.vergenet.net/linux/aggregate/"
license="GPL"
#makedepends=('autoconf' 'automake' 'gcc' 'glibc' 'popt' 'vanessa_logger')
makedepends=('automake' 'gcc' 'glibc' 'popt' 'vanessa_logger')
depends=('glibc' 'popt' 'vanessa_logger')
source=(http://www.vergenet.net/linux/aggregate/download/$pkgname-$pkgver.tar.gz)
md5sums=('ca4401a4bdfaa7710fb5c5af98f00b3b')
arch=('i686' 'x86_64')

build() {
  cd $startdir/src/$pkgname-$pkgver

  ./configure --prefix=/usr 
  make || return 1
  make DESTDIR=$startdir/pkg install

}
