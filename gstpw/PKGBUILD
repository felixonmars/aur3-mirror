# Maintainer: Lucas Canonaco <canolucas at gmail dot com>
pkgname=gstpw
pkgver=0.1
pkgrel=1
pkgdesc="Cool stopwatch program"
arch=('any')
url="http://code.google.com/p/gstpw/"
license=('GPL')
depends=('gtk2' 'libglade')
source=(http://gstpw.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('deeddfbe79d12a30859ffaf1d029d2fc')
build() {
cd $srcdir/$pkgname
./configure --prefix=/usr
make || return 1
make DESTDIR=$pkgdir install || return 1
}
