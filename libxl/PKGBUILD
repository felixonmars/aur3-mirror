# Maintainer: Christian Bühler <christian.buehler@ipoplan.de>
pkgname=libxl
pkgver=3.6.0.1
pkgrel=1
pkgdesc="excel library for developers"
arch=('x86_64')
url="http://www.libxl.com/"
license=('custom')
source=(ftp://xlware.com/$pkgname-lin-$pkgver.tar.gz)
md5sums=('3c927bf2b2f82bf4f5f0054f0c71dac7')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/share/doc"
  cp -r doc "$pkgdir/usr/share/doc/libxl"
  cp -r include_cpp "$pkgdir/usr/include"
  cp -r lib64 "$pkgdir/usr/lib"

  install -D license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

# vim:set ts=2 sw=2 et:
