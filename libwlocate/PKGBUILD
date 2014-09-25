# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
# Contributor: Bjoern Franke <bjo@nord-west.org>
pkgname=libwlocate
pkgver=0.r259.88be963
pkgrel=1
pkgdesc="libwlocate is a shared library that can be used for location-based services"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libwlocate"
license=('GPL')
depends=('wireless_tools')
makedepends=('git')
source=("$pkgname::git+git://git.code.sf.net/p/libwlocate/code")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname/master"
  make -f Makelib
  make
}

package() {
  cd "$pkgname/master"
  install -Dm644 libwlocate.so "$pkgdir/usr/lib/libwlocate.so"
  install -Dm644 libwlocate.h "$pkgdir/usr/include/libwlocate.h"
  install -Dm755 lwtrace "$pkgdir/usr/bin/lwtrace"
}

# vim:set ts=2 sw=2 et:
