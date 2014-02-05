pkgname=sfgui
pkgver=0.2.0
pkgrel=1
pkgdesc="SFGUI (Simple and Fast Graphical User Interface), a C++ GUI library for SFML."
arch=(i686 x86_64)
url="http://sfgui.sfml-dev.de"
license=("zlib")
source=("SFGUI-$pkgver-source.zip::http://sfgui.sfml-dev.de/download/29")
makedepends=(cmake)
depends=(sfml)
md5sums=('d264e7e804a9d8e1c99bf3cdca29204b')

build() {
  cd "$srcdir/SFGUI-$pkgver"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}
package() {
	cd "$srcdir/SFGUI-$pkgver"
	mkdir -p "$pkgdir/usr/share/licenses/sfgui"
	make DESTDIR=$pkgdir install
	ln -s "/usr/share/SFGUI/LICENSE" "$pkgdir/usr/share/licenses/sfgui/LICENSE"
}
