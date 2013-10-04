# Maintainer: Axper Jan <483ken _at_ gmail _dot_ com

pkgname=glfw3-doc
pkgver=3.0.3.16.g8194f1e
pkgrel=1
pkgdesc="Set of HTML documentation for GLFW"
arch=('any')
url="http://www.glfw.org/"
license=('custom:ZLIB')
makedepends=('cmake')
source=("git+git://github.com/glfw/glfw.git")
md5sums=('SKIP')

pkgver() {
	cd glfw
	local ver="$(git describe --long)"
	printf "%s" "${ver//-/.}"
}

build() {
  cd "$srcdir/glfw"
	cmake -D CMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=YES .
	make docs
}

package() {
	mkdir -p "$pkgdir/usr/share/doc/glfw"
	cp -r "$srcdir/glfw/docs/html" "$pkgdir/usr/share/doc/glfw"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/glfw/COPYING.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
