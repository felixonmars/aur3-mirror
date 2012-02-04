# Maintainer: Martti Kühne <mysatyre at gmail dot com>

pkgname=ktoon
pkgver=0.9a_rev1613
pkgrel=1
pkgdesc="2D Animation Toolkit designed by animators for animators, focused on the Cartoon Industry"
arch=('i686' 'x86_64')
url=http://www.ktoon.net/
license=(GPL)
makedepends=(kom=$pkgver)
depends=(ffmpeg 'qt>=4' ruby zlib aspell "kom=$pkgver")
source=(http://download.berlios.de/ktoon/$pkgname-${pkgver/_/-}.tar.gz komconfig.rb ktoon.patch)
md5sums=('8979ed5d40aa61c73420d3f3685b905e'
         'f605dadf8b312de5516ac32390863cb7'
         '773058010fa18b937e712cb6761fb663')

build() {
  cd "$srcdir/$pkgname-${pkgver/_/-}"
  cp $srcdir/komconfig.rb qonf/komconfig.rb
  patch -Np1 <../../ktoon.patch
  ./configure "--prefix=$pkgdir/usr"
  make
}
package() {
  cd "$srcdir/$pkgname-${pkgver/_/-}"
  sed -ir "s@/usr/share/applications@$pkgdir/usr/share/applications@g; s@/usr/share/pixmaps@$pkgdir/usr/share/pixmaps@g" src/shell/Makefile
  make install
}