# maintainer: perlawk

pkgname=ulsiod
pkgver=1.0
pkgrel=2
pkgdesc="some modifications and some builtin functions added to  Scheme in one day."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/muesli/ulsiod.html"
license=('GPL')
depends=('gcc')
source=("ftp://216.92.2.134/savannah/muesli/ulsiod-1.0.tar.gz")
options=(!strip)

build() {
  cd "${srcdir}/"$pkgname-$pkgver/src
	sed -i 's/Welcome to SIOD, Scheme In One Defun, Version/Welcome to ULSIOD Version 1.0, derived from Scheme In One Defun V/' slib.c
  cd "${srcdir}/"$pkgname-$pkgver
	./configure --prefix=/usr
	make
}

package() {
  cd "${srcdir}/"$pkgname-$pkgver
	mkdir -p "$pkgdir"/usr/bin
	cp siod "$pkgdir"/usr/bin
}
md5sums=('a82f12eaa5c250f823a20b051945c7d8')

