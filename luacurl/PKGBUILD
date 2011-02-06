# Maintainer: Laszlo Papp <djszapi2 at gmail dot com>
pkgname=luacurl
pkgver=1.2.1
pkgrel=1
pkgdesc="Module providing Internet browsing capabilities based on the cURL library"
url="http://curl.haxx.se/libcurl/lua/"
license=('GPL')
arch=('i686')
source=(http://luaforge.net/frs/download.php/3342/$pkgname-$pkgver.zip)
md5sums=('4c83710a0fc5ca52818e5ec0101c4395')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake ${srcdir}/${pkgname}-${pkgver}
  sed -i 's/\/usr\/local/\/usr/g' cmake_install.cmake
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
