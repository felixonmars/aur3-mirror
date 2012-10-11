# Maintainer: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: 

_pkgbasename=cracklib
pkgname=lib32-$_pkgbasename
pkgver=2.8.19
pkgrel=1
pkgdesc="Password Checking Library (32 bit)"
arch=('x86_64')
url="http://sourceforge.net/projects/cracklib"
license=('LGPL')
depends=('lib32-glibc' 'lib32-zlib' "$_pkgbasename")
makedepends=('gcc-multilib')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/$_pkgbasename/$_pkgbasename-$pkgver.tar.gz)
md5sums=('ca0ec168d9c6466612204e8dfb2df8a9')

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  ./configure --prefix=/usr --libdir=/usr/lib32 --without-python CC='gcc -m32'
  make
}

package() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}/usr"/{include,sbin,share}
}
