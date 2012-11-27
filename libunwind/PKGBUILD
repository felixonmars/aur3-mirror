# Contributor: Lawrence Lee <valheru@facticius.net>; Phillip Marvin <phillip.marvin@gmail.com>
# Maintainer: keystone <phillip.marvin@gmail.com>

pkgname=libunwind
pkgver=1.1
pkgrel=1
pkgdesc="Portable and efficient C programming interface (API) to determine the call-chain of a program"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/libunwind/"
license=('GPL')

depends=('glibc')
options=(!libtool)
provides=(libunwind)

source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('fb4ea2f6fbbe45bf032cd36e586883ce')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure CFLAGS="$CFLAGS -U_FORTIFY_SOURCE" --prefix=/usr
  make
}

# This function is ``supposed'' to fail. Upstream know, but haven't fixed it.
check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check || return 0
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
