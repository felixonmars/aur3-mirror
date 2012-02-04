# Contributor: Hauke Wesselmann <hauke@h-dawg.de>

pkgname=libopensync-plugin-syncml
pkgver=0.39
pkgrel=1
pkgdesc='Syncml plugin for OpenSync'
arch=('i686' 'x86_64')
url="http://www.opensync.org"
license="LGPL"
depends=('libopensync=0.39' 'libsyncml')
makedepends=('cmake')
options=('!libtool')
source=("http://www.opensync.org/download/releases/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('02922ebeec8b9eab77b1cffbb19c81be')

build() {
  cd $srcdir
  mkdir build
  cd build
  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=$pkgdir install
}
