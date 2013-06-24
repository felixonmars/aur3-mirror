# Maintainer: Testuser_01 <arch@nico-siebler.de>
# Contributor: Testuser_01 <arch@nico-siebler.de>

pkgname=pecl-spltypes
pkgver=0.4.0
pkgrel=1
pkgdesc="Standard PHP Library Types"
arch=('any')
url="http://pecl.php.net/package/SPL_Types"
license=('PHP')
depends=('php')
makedepends=('autoconf')
source=("http://pecl.php.net/get/SPL_Types-${pkgver}.tgz")
md5sums=('f858784f55f584f0bf323cfd2a71982b')

package() {
  cd ${srcdir}/SPL_Types-${pkgver} || return 1
  phpize || return 1
  ./configure --prefix=/usr || return 1
  make INSTALL_ROOT=${pkgdir} install || return 1
}
