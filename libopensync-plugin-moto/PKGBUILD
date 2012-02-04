# Contributor: Pavel Mironov <wanderermg@gmail.com>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>

pkgname=libopensync-plugin-moto
pkgver=0.36
pkgrel=1
pkgdesc='Moto plugin for OpenSync'
url='http://www.opensync.org'
license=('LGPL')
arch=('i686' 'x86_64')
depends=('libopensync-unstable')
makedepends=('cmake')
source=(http://www.opensync.org/download/releases/$pkgver/$pkgname-$pkgver.tar.bz2)
options=('!libtool')
md5sums=('8dcecd4afb87e4645a152194fd3b5e55')

build() {
  cd ${startdir}/src
  mkdir build
  cd build
  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
