# Maintainer: André R. de Miranda <ardemiranda@gmail.com>
pkgname=cpmjs
pkgver=master
pkgrel=4
pkgdesc="CommonJS Package Manager"
url="https://github.com/kriszyp/cpm"
arch=(i386 x86_64)
license=('BSD')
depends=('java-environment' 'bash')
install=${pkgname}.install

package() {

  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/bin

  curl https://raw.github.com/kriszyp/cpm/master/install | CPM_INSTALL_LIB=$pkgdir/usr/lib CPM_INSTALL_BIN=$pkgdir/usr/bin bash

}
