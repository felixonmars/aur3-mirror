# Maintainer: Arseniy Krasnov arseniy@krasnoff.org
pkgname=lightpack
pkgver=5.5
pkgrel=2
pkgdesc="Lightpack is a monitor light device used for presence effect strengthening. "
url="http://code.google.com/p/lightpack/"
arch=('i686')
depends=('deb2targz')
license=('GPLv3')
source=("http://lightpack.googlecode.com/files/${pkgname}_${pkgver}-1_i386.deb")
md5sums=('46668aaf9b81a19adffdbd9f16ab1de0')
 
build() {
cd ${srcdir}
 
  deb2targz lightpack_5.5-1_i386.deb
  tar -zxf lightpack_5.5-1_i386.tar.gz 
  
}
