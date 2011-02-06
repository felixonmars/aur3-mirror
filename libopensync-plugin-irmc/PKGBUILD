# Contributor: Sven Salzwedel <sven_salzwedel@web.de>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>

pkgname=libopensync-plugin-irmc
pkgver=0.36
pkgrel=4
pkgdesc="Irmc plugin for OpenSync"
url="http://www.opensync.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('libopensync-unstable' 'openobex')
makedepends=('cmake')
source=(http://www.opensync.org/download/releases/$pkgver/$pkgname-$pkgver.tar.bz2?format=raw)
options=('!libtool')
md5sums=('21f9789fa41c2f06c547a17bc13c6081')

build() 
{
  cd ${startdir}/src
  mkdir build
  cd build
  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
