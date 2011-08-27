# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
pkgname=libopensync-plugin-tomboy-sync
pkgver=0.38
pkgrel=1
pkgdesc='Tomboy synchronisation plugin for OpenSync'
url='http://www.opensync.org'
license=('LGPL')
arch=('i686' 'x86_64')
depends=('tomboy' 'libopensync-unstable')
makedepends=('cmake')
source=(http://www.opensync.org/download/releases/$pkgver/$pkgname-$pkgver.tar.bz2)
options=('!libtool')
md5sums=('e65533c82b6f9e4415d1fa7f349d421b')

build() {
  cd $srcdir
  mkdir build
  cd build
  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=$pkgdir install
}
