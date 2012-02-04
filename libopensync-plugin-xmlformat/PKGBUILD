# Contributor: William Rea <sillywilly@gmail.com> , Robert Emil Berge <filoktetes@linuxophic.org>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>

pkgname=libopensync-plugin-xmlformat
pkgver=0.39
pkgrel=1
pkgdesc="XML format plugin for OpenSync"
arch=('i686' 'x86_64')
url="http://www.opensync.org"
license="LGPL"
depends=('libopensync=0.39')
makedepends=('cmake')
options=('!libtool')
source=("http://www.opensync.org/download/releases/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('cd0563bb78b50f846b5970b360a49213')

build() {
  cd $srcdir
  mkdir build
  cd build
  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=$pkgdir install
}
