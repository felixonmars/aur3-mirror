# PKGBUILD by hasufell

pkgname=bjfilter-i560
pkgver=2.4
pkgrel=1
pkgdesc="Bjfilterpixus for canon i560"
url="http://www.canon.at/"
license="other"
arch=('i686' 'x86_64')
depends=('cups' 'bjfiltercups-i560')
makedepends=('rpm2tgz')

source=(ftp://download.canon.jp/pub/driver/bj/linux/bjfilterpixus560i-2.4-0.i386.rpm)
md5sums=('f9725282b11bc5bc01a20ac6764f4bf9')
          
build() {

 cd $srcdir
 rpm2targz bjfilterpixus560i-2.4-0.i386.rpm
 tar -xf bjfilterpixus560i-2.4-0.i386.tar.gz -C $pkgdir

}
