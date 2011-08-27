# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: Sven Salzwedel <sven_salzwedel@web.de>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>

pkgname=libopensync-plugin-file-unstable
pkgver=0.39
pkgrel=1
pkgdesc='File plugin for OpenSync'
arch=('i686' 'x86_64')
url="http://www.opensync.org"
license="LGPL"
depends=('libopensync=0.39')
replaces=('libopensync-plugin-file')
conflicts=('libopensync-plugin-file')
provides=('libopensync-plugin-file=0.39')
makedepends=('cmake')
options=('!libtool')
source=(http://www.opensync.org/download/releases/$pkgver/libopensync-plugin-file-$pkgver.tar.bz2)
md5sums=('4e4aeb1012b504c005c7f235b1bd0e60')

build() {
  cd $srcdir
  mkdir build
  cd build
  cmake ../libopensync-plugin-file-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=$pkgdir install
}
