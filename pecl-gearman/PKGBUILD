# Contributor: @nolochemical
 
pkgname=pecl-gearman
pkgver=1.0.2
pkgrel=1
pkgdesc="PECL extension of gearmand"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/gearman"
license=('PHP')
depends=('gearmand')
makedepends=('autoconf')
source=(http://pecl.php.net/get/gearman-${pkgver}.tgz)
md5sums=('98464746d1de660f15a25b1bc8fcbc8a')
 
 
build() {
  cd ${srcdir}/gearman-${pkgver}
  phpize
  ./configure
  make INSTALL_ROOT=${pkgdir} install
}
