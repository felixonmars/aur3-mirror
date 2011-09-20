# Maintainer: Martti Kühne <mysatyre at gmail dot com>

pkgname=kom
pkgver=0.9a_rev1613
pkgrel=1
pkgdesc="Interface library for ktoon, a 2D Animation Toolkit"
arch=('i686' 'x86_64')
url=http://www.ktoon.net/
license=(GPL)
depends=(ffmpeg 'qt>=4' ruby zlib aspell mesa)
conflicts=("ktoon<$pkgver")
source=(http://download.berlios.de/ktoon/kom-${pkgver/_/-}.tar.gz kom_test.patch)
md5sums=('2dface677460f571eff9fb48203cdaaa'
         '61159ab9462096e53ea705dcdca8bff5')

build() {
  cd "$srcdir/$pkgname-${pkgver/_/-}"
  patch -Np1 <../kom_test.patch
  ./configure --prefix="$pkgdir/usr"
  rm qonf.pri
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver/_/-}"
  make install
}
