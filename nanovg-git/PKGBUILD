# Maintainer: Vladimir Matveev <vladimir dot matweev at gmail dot com> 

pkgname=nanovg-git
pkgver=r220.646b0a5
pkgrel=1
pkgdesc="Small antialiased vector graphics rendering library for OpenGL"
arch=('i686' 'x86_64')
url="https://github.com/memononen/nanovg"
license=('ZLIB')
makedepends=('git')
conflicts=('nanovg')
provides=('nanovg')
source=("$pkgname"::'git://github.com/memononen/nanovg.git')
md5sums=('SKIP')
options=('staticlibs')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  premake4 gmake
  cd build
  make nanovg
}

package() {
  install -v -Dm644 "$srcdir/$pkgname/build/libnanovg.a" "$pkgdir/usr/lib/libnanovg.a" || exit 1
  install -v -Dm644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt" || exit 1
  install -v -Dm644 "$srcdir/$pkgname/src/nanovg.h" "$pkgdir/usr/include/nanovg/nanovg.h" || exit 1
  install -v -Dm644 "$srcdir/$pkgname/src/nanovg_gl.h" "$pkgdir/usr/include/nanovg/nanovg_gl.h" || exit 1
  install -v -Dm644 "$srcdir/$pkgname/src/nanovg_gl_utils.h" "$pkgdir/usr/include/nanovg/nanovg_gl_utils.h" || exit 1
  install -v -Dm644 "$srcdir/$pkgname/src/fontstash.h" "$pkgdir/usr/include/nanovg/fontstash.h" || exit 1
}
