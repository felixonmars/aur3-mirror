# Maintainer: Philipp Trommler <ph.trommler@gmail.com>
pkgname=geany-overview-plugin-git
pkgver=r24.a209747
pkgrel=1
pkgdesc="A small zoomed-out view next to the normal editor view that allows to see and navigate a lot of the file at once."
arch=("i686" "x86_64")
url="https://github.com/codebrainz/overview-plugin/"
license=("GPL2")
depends=("geany")
source=("git://github.com/codebrainz/overview-plugin.git")
md5sums=("SKIP")

pkgver() {
	cd "overview-plugin"
  	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "overview-plugin"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "overview-plugin"
	make DESTDIR="$pkgdir/" install
}
