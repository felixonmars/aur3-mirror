# Maintainer: Mika Hynnä 'ighea' igheax at gmail dot com 
pkgname=php-yaml-syck
pkgver=0.9.3
pkgrel=1
pkgdesc="A binding to the Syck library."
url="http://pecl.php.net/package/syck"
license=('PHP')
depends=('php' 'syck')
arch=('x86_64' 'i686' 'arm')
source=(http://pecl.php.net/get/syck-$pkgver.tgz)

build() {
  cd $srcdir/syck-$pkgver
  phpize  
  ./configure
  make
  make test
  INSTALL_ROOT=$pkgdir make install
}
md5sums=('cbbe638b431f74eec71c76588cd14f7e')
