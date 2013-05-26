# Maintainer: Testuser_01 <arch@nico-siebler.de>
# Contributor: Testuser_01 <arch@nico-siebler.de>

pkgname=pecl-svn
pkgver=1.0.2
pkgrel=1
pkgdesc="PHP Bindings for the Subversion Revision control system."
arch=('any')
url="http://pecl.php.net/package/svn"
license=('PHP')
depends=('php')
makedepends=('autoconf')
source=("http://pecl.php.net/get/svn-${pkgver}.tgz")
md5sums=('45407d43f1055eb72e149d1862f3daa1')

package() {
  cd ${srcdir}/svn-${pkgver} || return 1
  phpize || return 1
  ./configure || return 1
  make INSTALL_ROOT=${pkgdir} install || return 1
}
