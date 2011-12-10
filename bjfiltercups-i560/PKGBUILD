# PKGBUILD by hasufell

pkgname=bjfiltercups-i560
pkgver=2.4
pkgrel=1
pkgdesc="Bjfiltercups for canon i560"
url="http://www.canon.at/"
license="other"
arch=('i686' 'x86_64')
depends=('cups' 'libpng12')
makedepends=('rpm2tgz')

source=(ftp://download.canon.jp/pub/driver/bj/linux/bjfiltercups-2.4-1.i386.rpm)
md5sums=('2233c5228ba5b7c10edb2f3c1ca33f14')
          
build() {

 cd $srcdir
 rpm2targz bjfiltercups-2.4-1.i386.rpm
 tar -xf bjfiltercups-2.4-1.i386.tar.gz -C $pkgdir

 cd $pkgdir/usr/lib
 ln -s libpng12.so.0 libpng.so.2

}
