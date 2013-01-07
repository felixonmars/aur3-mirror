# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=soundtouch
pkgname=lib32-$_pkgbase
pkgver=1.7.1
pkgrel=1
pkgdesc="An audio processing library (32 bit)"
arch=('x86_64')
url="http://www.surina.net/soundtouch/"
license=('LGPL')
depends=('lib32-gcc-libs' "$_pkgbase")
makedepends=('gcc-multilib')
options=('!libtool')
source=("$url/$_pkgbase-$pkgver.tar.gz")
sha1sums=('8b1a461754853f9c7328571449b7f9b8bd578a89')

build() {
  cd $_pkgbase
  
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADER/' configure.ac
  ./bootstrap
  ./configure --prefix=/usr --libdir=/usr/lib32 --enable-shared --with-pic CXX='g++ -m32'
  make
}

check() {
  cd $_pkgbase
  make check
}

package() {
  make -C $_pkgbase DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{bin,doc,include,share}
}

