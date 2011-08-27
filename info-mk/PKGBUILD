# Maintainer: matrhack <matrhack@gmail.com>
pkgname=info-mk
pkgver=0.05
pkgrel=2
pkgdesc="Perl script displaying system infos"
arch=('any')
url="http://ftp.matrhack.free.fr/"
license=('GPL')
depends=('perl')
source=(http://ftp.matrhack.free.fr/download/$pkgname-$pkgver.tar)
md5sums=('ba85af26ad85f8373db7c79b01ae8727')

build() {
install -m755 -D info-mk.pl $pkgdir/usr/bin/info-mk
}