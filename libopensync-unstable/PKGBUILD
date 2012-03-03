# Contibutor: Hauke Wesselmann <hauke@h-dawg.de>
pkgname=libopensync-unstable
pkgver=0.39
pkgrel=1
pkgdesc='Development version of the opensync synchronisation framework'
url='http://www.opensync.org'
license=('LGPL')
arch=('i686' 'x86_64')
makedepends=('python' 'cmake')
depends=('glib2' 'libxml2' 'sqlite3' 'libxslt')
options=('!libtool')
replaces=('libopensync')
conflicts=('libopensync')
provides=('libopensync=0.38')
source=(http://www.opensync.org/download/releases/$pkgver/libopensync-$pkgver.tar.bz2)
sha512sums=('038c92e2599ca31d6633dd60eaf44e157887d285c8946740afb153c4afb98b718f3f73251212e1055452a793142d0d27e2edf510a9830308d20d9c7d4023c7e4')

build() {
  cd $srcdir/
  mkdir build
  cd build
  cmake ../libopensync-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  
  make VERBOSE=1
}

package() {
  cd $srcdir/build
  make DESTDIR=$pkgdir install
}
