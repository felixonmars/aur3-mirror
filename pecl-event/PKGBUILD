# Maintainer: Andrew Rose <rose.andrew@gmail.com>
# Contributor: Andrew Rose <rose.andrew@gmail.com>

pkgname=pecl-event
pkgver=1.9.0
pkgrel=1
pkgdesc="Provides interface to libevent library"
arch=('any')
url="http://pecl.php.net/package/event"
license=('PHP')
depends=('php')
makedepends=('autoconf')
source=("http://pecl.php.net/get/event-${pkgver}.tgz")
md5sums=('f88c6e55cb532d02fc51d4988e7fe4bf')

package() {
  cd ${srcdir}/event-${pkgver} || return 1
  phpize || return 1
  ./configure -enable-maintainer-zts || return 1
  make INSTALL_ROOT=${pkgdir} install || return 1
}
