# Maintainer: tobias <email@tobiasklare.de>
pkgname=bjfilteri250
pkgver=2.3
pkgrel=1
pkgdesc="Bjfilter for canon i250"
url="http://www.canon.at/"
license="other"
arch=('i686')
depends=('cups')
makedepends=('rpm2targz-gentoo')

source=(http://de.software.canon-europe.com/files/soft20547/software/$pkgname-$pkgver-0.i386.rpm)
md5sums=('bd38376bbb307972fd39ede07a066931')

build() {
 cd $startdir/src/
 rpm2targz bjfilteri250-$pkgver-0.i386.rpm
 tar -xf bjfilteri250-$pkgver-0.i386.tar.gz -C $startdir/pkg/
 ln -s /usr/lib/libpng.so.3 $startdir/pkg/usr/lib/libpng.so.2
}
 
