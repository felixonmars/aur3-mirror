# Maintainer: Clément Démoulins <clement@archivel.fr>

pkgname=mirall-owncloud
_pkgname=mirall
pkgver=1.0.2
pkgrel=1
pkgdesc="Folder synchronization (ownCloud version)"
arch=('i686' 'x86_64')
url="http://owncloud.org/sync-clients/"
license=('GPL2')
depends=('qt' 'csync-owncloud>=0.50.6')
makedepends=('cmake')
provides=('owncloud-client' 'mirall')
conflicts=('owncloud-client', 'mirall')
install=mirall.install
backup=('etc/exclude.lst')

source=(http://download.owncloud.com/download/$_pkgname-$pkgver.tar.bz2)
md5sums=('6f8849f7d66aba7175fe4c634dd53bc3')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  [ -d build ] || mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=${_buildtype} -UOWNCLOUD_CLIENT ..
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
