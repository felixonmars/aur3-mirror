# Maintainer: FX-Ti <zjxiang1998@gmail.com>

pkgname=acr122u_driver
pkgver=1.0.4
pkgrel=1
pkgdesc="The ACR122U Reader Driver"
arch=('i686' 'x86_64')
url="http://www.acs.com.hk/"
license=('GPL')
makedepends=('make')
source=('acsccid-1.0.4.tar.bz2')
md5sums=('c03fea8824766097845b3492f57b0296')


build() {
  cd "acsccid-$pkgver"
  ./configure
  make || return 1
  make install || return 1
}


