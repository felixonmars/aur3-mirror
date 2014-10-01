# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=libebur128-git
_pkgname=${pkgname%-git}
pkgver=1.0.2.0.g05a6c1a
pkgrel=1
pkgdesc="library implementing the EBU R128 loudness standard"
arch=(x86 x86_64)
url="https://github.com/jiixyj/libebur128"
license=('AS IS')
depends=('speex')
makedepends=('git' 'cmake')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+https://github.com/jiixyj/libebur128.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed -r 's/-/./g;s/^v//'
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" ../${_pkgname}
  make
}

package() {
  cd "$srcdir/build"
  make install
}

# vim:set ts=2 sw=2 et:
