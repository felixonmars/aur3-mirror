# Maintainer: Rafał Trójniak <aur@trojniak.net>

pkgname=pecl-zookeeper
pkgver=0.2.2
pkgrel=2
pkgdesc="PHP extension for interfacing with Apache ZooKeepe"
arch=('any')
url="http://pecl.php.net/package/svn"
license=('PHP')
depends=('php' 'zookeeper-c-client')
makedepends=('autoconf')
source=("http://pecl.php.net/get/zookeeper-${pkgver}.tgz")
md5sums=('b46202e9ef187aaf3ae71d7fb336f7a3')

package() {
  cd ${srcdir}/zookeeper-${pkgver} || return 1
  phpize || return 1
  ./configure || return 1
  make INSTALL_ROOT=${pkgdir} install || return 1
}
