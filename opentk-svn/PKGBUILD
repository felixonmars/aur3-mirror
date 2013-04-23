pkgname=opentk-svn
pkgver=3126
pkgrel=5
pkgdesc="An advanced, cross-platform, C-sharp OpenGL, OpenAL and OpenCL wrapper for Mono/.Net (svn)"
arch=(i686 x86_64)
license=("MIT")
depends=(mono)
makedepends=(subversion)
url="http://www.opentk.com"
conflicts=(opentk)
provides=(opentk)
source=("${pkgname%-*}::svn+https://opentk.svn.sourceforge.net/svnroot/opentk/trunk")
md5sums=(SKIP)

pkgver() {
	cd "$SRCDEST/${pkgname%-*}"
	svnversion
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	xbuild OpenTK.sln
}

package() {
	cd "${srcdir}/${pkgname%-*}/Binaries/OpenTK/Debug/"
	find . -name '*.config' -o -name '*.mdb' -o -name '*.dll' -o -name '*.xml' |
		xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/opentk/"{}
	cp -r Data "$pkgdir/usr/lib/opentk/"
	rm "$pkgdir/usr/lib/opentk/"{Bind,Build.UpdateVersion,Convert}.exe.mdb
	install -m755 "Examples.exe" "$pkgdir/usr/lib/opentk/"
	install -Dm644 "${srcdir}/${pkgname%-*}/Documentation/License.txt" "$pkgdir/usr/share/licenses/opentk/License.txt"
	find . -name '*.dll' | xargs -rtl1 -I {} gacutil -i {} -root "$pkgdir/usr/lib"
	find "$pkgdir/usr/lib/opentk/" -name '*.dll' -o -name '*.exe' | xargs -rtl1 mono --aot
}
