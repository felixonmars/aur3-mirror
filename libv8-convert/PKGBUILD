# Maintainer: Sarah Harvey <worldwise001@gmail.com>
# Contributor: Sarah Harvey <worldwise001@gmail.com>

pkgname=libv8-convert
pkgver=20120219
pkgrel=1 
pkgdesc="The v8-convert API is a spin-off of the core-most components of the v8-juice library."
url="https://code.google.com/p/v8-juice/wiki/V8Convert"
arch=('i686' 'x86_64')
license=('GPL')
depends=('nodejs' 'v8')
source=('https://v8-juice.googlecode.com/files/libv8-convert-20120219.tar.gz')
md5sums=('5cc690adb08853c2e346081b705e08f7')
build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
}

package() {
  mkdir -p $pkgdir/usr/
  cp -R $srcdir/$pkgname-$pkgver/include/ $pkgdir/usr/
}
