# Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>

pkgname=aggregate
pkgver=1.0.2
pkgrel=3
pkgdesc="A tool for aggregating IPv4 CIDR networks"
arch=('i686' 'x86_64')
url="http://www.vergenet.net/linux/aggregate/"
license="GPL"
depends=('popt' 'vanessa-logger')
source=(${url}/download/$pkgname-$pkgver.tar.gz)
md5sums=('ca4401a4bdfaa7710fb5c5af98f00b3b')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
