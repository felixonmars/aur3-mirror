# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: Sven Salzwedel <sven_salzwedel@web.de>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
pkgname=libopensync-plugin-evolution2
pkgver=0.39
pkgrel=1
pkgdesc='Novell Evolution plugin for OpenSync'
arch=('i686' 'x86_64')
url="http://www.opensync.org"
license="LGPL"
depends=('libopensync=0.39' 'evolution-data-server')
makedepends=('cmake')
options=('!libtool')
source=("http://www.opensync.org/download/releases/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('54d2fc3c80c29f3ac5feb609b082c99d')

build() {
  cd $srcdir
  mkdir build
  cd build
  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=$pkgdir install
}
