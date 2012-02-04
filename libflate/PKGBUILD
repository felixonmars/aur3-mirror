# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=libflate    
pkgver=2.0
pkgrel=1
pkgdesc="A template library used to deal with HTML code in CGI Applications"
arch=('i686' 'x86_64')
url="http://flate.dead-inside.org"
license=('LGPL')
depends=('glibc')
makedepends=('patch')
source=("http://flate.dead-inside.org/$pkgname-$pkgver.tar.gz" "patch")
md5sums=('71bbf67714e0c5a5bbd969168d0f469a'
         '4d688fb56417c375380236c731c2f87a')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -uNi $srcdir/patch

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
