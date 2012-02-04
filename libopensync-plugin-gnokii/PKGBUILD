# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>

pkgname=libopensync-plugin-gnokii
pkgver=0.36
pkgrel=4
pkgdesc="Gnokii Plugin for the opensync synchronization framework"
url="http://www.opensync.org"
license="LGPL"
arch=('i686' 'x86_64')
depends=('gnokii' 'libopensync-unstable')
makedepends=('cmake')
options=(!libtool)
source=(http://www.opensync.org/download/releases/$pkgver/$pkgname-$pkgver.tar.bz2?format=raw)
md5sums=('571c263bb77d8d7fd721068e4e49d979')

build() {
  cd ${startdir}/src
  mkdir build
  cd build
  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
