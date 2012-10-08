# Maintainer: Eric Waller <ewwaller@gmail.com>
pkgname=3dmaze
pkgver=f9b4d4a94f70
pkgrel=1
pkgdesc="Maze Generator with 3d Walk Through"
arch=('i686' 'x86_64')
url="https://bitbucket.org/ewaller/3dmaze/overview"
license=('GPL')
groups=(users)
depends=(qt)
makedepends=('make' 'gcc')
source=(https://bitbucket.org/ewaller/3dmaze/get/$pkgver.tar.bz2)
md5sums=('8c8115286d4b6cd9aec882c7b5b254d7')

build() {
  cd $srcdir/ewaller-$pkgname-$pkgver
  make
}

package() {
  cd 
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/local
  mkdir $pkgdir/usr/local/bin
  cp $srcdir/ewaller-$pkgname-$pkgver/3dmaze $pkgdir/usr/local/bin/
}

# vim:set ts=2 sw=2 et:
