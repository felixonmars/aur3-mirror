# Maintainer: Gadget3000 <gadget3000 at msn dot com>
pkgname=libcda
pkgver=0.5
pkgrel=1
pkgdesc="A simple, cross-platform CD playing library"
arch=('i686' 'x86_64')
url="http://tjaden.strangesoft.net/libcda/"
license=('custom')
source=(http://tjaden.strangesoft.net/libcda/$pkgname-$pkgver.tar.gz)
md5sums=('e16992259c588a9d0686fa5196a54824')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gcc -O2 -fPIC -DPIC -o linux.o -c linux.c  
  gcc -O2 -g -shared -Wl,-soname=libcda.so.0 -o libcda.so.0 linux.o
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 libcda.so.0 ${pkgdir}/usr/lib/libcda.so.0
  install -D -m644 libcda.h ${pkgdir}/usr/include/libcda/libcda.h
  ln -s /usr/lib/libcda.so.0 ${pkgdir}/usr/lib/libcda.so

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
