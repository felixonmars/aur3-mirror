# Maintainer: Michael Alexander <beefsack(at)gmail(dot)com>

pkgname=utlauncher-git
pkgver=r47.77e23ba
pkgver() {
  cd UTLauncher
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc='Unreal Tournament 4 launcher'
url='https://github.com/CodeCharmLtd/UTLauncher'
arch=('i686' 'x86_64')
license=('MIT')
source=('UTLauncher::git+https://github.com/CodeCharmLtd/UTLauncher.git')
sha1sums=('SKIP')
conflicts=(utlauncher)
provides=(utlauncher)
depends=(qt5-base libxkbcommon-x11)
makedepends=(git cmake boost)
build() {
	cd UTLauncher
	git submodule update --init --recursive
	cmake .
	make
}
package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/UTLauncher/UTLauncher" "$pkgdir/usr/bin/UTLauncher"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/UTLauncher/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
