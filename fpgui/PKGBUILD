pkgname=fpgui
pkgver=1.0
pkgrel=1
pkgdesc="Widget set to quickly develop cross-platform GUI software using the Free Pascal Compiler"
url="http://fpgui.sourceforge.net"
license=("LGPL2")
arch=(i686 x86_64)
makedepends=(fpc)
source=("http://downloads.sourceforge.net/fpgui/fpgui_source-$pkgver.tar.gz")
md5sums=('f6ae3f31550651d8c62e8d6f8d210707')

_unittgt=`fpc -iSP`-`fpc -iSO`
_fpcver=`fpc -iV`

build() {
	cd "${srcdir}/fpgui-$pkgver/src"
	./build.sh
}

package() {
	cd "${srcdir}/fpgui-$pkgver/lib/$_unittgt"
	find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a' -o -name '*.compiled' |
		xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/fpgui/"{}
	cd "${srcdir}/fpgui-$pkgver"
	install -Dm644 COPYING.modifiedLGPL "$pkgdir/usr/share/licenses/fpgui/COPYING.modifiedLGPL"
	install -m644 COPYING.txt "$pkgdir/usr/share/licenses/fpgui/"
}