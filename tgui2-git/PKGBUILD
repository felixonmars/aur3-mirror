pkgname=tgui2-git
pkgver=536e8e7
pkgrel=1
pkgdesc="TGUI is an Allegro 5 GUI library"
arch=(i686 x86_64)
url="http://www.nooskewl.com/content/quick-and-dirty-tgui-2-tutorial"
license=("custom:Give it Your Own License")
depends=(allegro-git ttf-dejavu)
makedepends=(git cmake)
source=("${pkgname%-*}::git+git://nooskewl.com/tgui2.git")
md5sums=('SKIP')

pkgver () {
	cd "$SRCDEST/${pkgname%-*}"
	echo "$(git describe --always | sed s/${_pkgname}-// | sed 's/-/./g')"
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	install -Dm644 "tgui2.hpp" "$pkgdir/usr/include/tgui2.hpp"
	install -m644 "tgui2_widgets.hpp" "$pkgdir/usr/include/"
	install -Dm644 "libtgui2.a" "$pkgdir/usr/lib/libtgui2.a"
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/tgui2/LICENSE.txt"
} 
