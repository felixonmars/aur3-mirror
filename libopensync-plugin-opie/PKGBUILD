# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
pkgname=libopensync-plugin-opie
pkgver=0.38
pkgrel=1
pkgdesc="Opie plugin for OpenSync"
url="http://www.opensync.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('libopensync-unstable' 'glib2' 'libxml2' 'curl')
makedepends=('cmake')
source=(http://www.opensync.org/download/releases/$pkgver/$pkgname-$pkgver.tar.bz2)
options=('!libtool')
md5sums=('5af4a3afd3f497edd682f1c88dfebf48')

build() 
{
  cd ${startdir}/src
  mkdir build
  cd build
  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
