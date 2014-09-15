# Maintainer: kevku <kevku@gmx.com>
pkgname=build
pkgver=0.3.10
pkgrel=1
pkgdesc="A massively-parallel software build system implemented on top of GNU make"
arch=('any')
url="http://www.codesynthesis.com/projects/build/"
license=('GPL2')
source=("http://www.codesynthesis.com/download/$pkgname/0.3/$pkgname-$pkgver.tar.bz2")
md5sums=('a7d2f4af455cb6c736c0fa02b10280f9')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install_prefix="$pkgdir/usr" install
}

