# Maintainer: Brandon Surmanski <b.surmanski@gmail.com>
pkgname=opencl-manpages
pkgver=1.2
pkgrel=1
pkgdesc="Manpages for OpenCL 1.2"
arch=(any)
url="http://www.khronos.org/registry/cl"
license=('unknown')
options=(zipman)
source=($pkgname-$pkgver.tar.gz)
md5sums=('3a6cf0f25cb03f104f546b7e2e51b477') #generate with 'makepkg -g'

package() {
  mkdir -p $srcdir/$pkgname-$pkgver
  tar -xf $pkgname-$pkgver.tar.gz -C $srcdir/$pkgname-$pkgver
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/man/man3"
  install -Dm644 *.3 "$pkgdir/usr/share/man/man3/"
}
