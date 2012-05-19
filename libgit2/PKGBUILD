# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=libgit2
pkgver=0.17.0
pkgrel=1
pkgdesc="A linkable library for Git"
arch=('i686' 'x86_64')
url="http://libgit2.github.com/"
depends=('zlib')
makedepends=('cmake')
license=('GPL2')
source=("src-$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/tarball/v$pkgver")
md5sums=('5a09dd1118d1354375407119d19e0f2c')

build() {
  cd "$srcdir"/$pkgname-*

  rm -fr build
  mkdir build && cd build

  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-*/build
  make DESTDIR="$pkgdir" install
}
