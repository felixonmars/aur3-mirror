# Contributor: Alexander 'hatred' Drozdoff <adrozdoff@gmail.com>
pkgname=openbsd-malloc
pkgver=1.83
pkgrel=2
pkgdesc="Alternative malloc() implementation from OpenBSD (useful for firefox/thunderbird)"
arch=(i686 x86_64)
url="http://mr.himki.net/index-alloc.html"
license=('custom:Beerware')
depends=('glibc')
makedepends=('gcc')
install=openbsd-malloc.install
source=(http://mr.himki.net/OpenBSD_malloc_Linux.c license.txt)
md5sums=('be4ad18f9bbb76b3299a12f3b6dc946f'
         '0b578bb0df968894254e323ef9bd794a')

build() {
  mkdir -p "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"

  cp ../OpenBSD_malloc_Linux.c ./
  gcc -shared -fPIC $CFLAGS OpenBSD_malloc_Linux.c -o malloc.so

  install -pD -m755 malloc.so      $pkgdir/opt/lib/malloc.so
  install -pD -m644 ../license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}
