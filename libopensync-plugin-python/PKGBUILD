# Contributor: Pavel Mironov <wanderermg@gmail.com>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>

pkgname=libopensync-plugin-python
pkgver=0.36
pkgrel=1
pkgdesc='Python plugin for OpenSync'
url='http://www.opensync.org'
license=('LGPL')
arch=('i686' 'x86_64')
depends=('libopensync-unstable')
makedepends=('cmake')
source=(http://www.opensync.org/download/releases/$pkgver//$pkgname-$pkgver.tar.bz2)
md5sums=('6247a7e96de3fa55c1fb58b2f364fb5e')

build() {
  cd ${startdir}/src
  mkdir build
  cd build
  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr 
-DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
