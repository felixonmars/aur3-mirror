pkgname=prebuild-svn
pkgver=324
pkgrel=4
pkgdesc="A cross-platform XML-driven pre-build tool which allows developers to easily generate project files for major IDE's and .NET development tools (svn)"
arch=(i686 x86_64)
url="http://mono-project.com/Prebuild"
license=("BSD")
depends=(mono)
makedepends=(subversion)
conflicts=(prebuild)
provides=(prebuild)
source=("${pkgname%-*}::svn+https://dnpb.svn.sourceforge.net/svnroot/dnpb/trunk"
"prebuild.sh")
md5sums=(SKIP '7388c48bf6c80b6b5d96f844f7fb2a62')

pkgver() {
	cd "$SRCDEST/${pkgname%-*}"
	svnversion
}

build() {
	cd "${srcdir}/${pkgname%-*}/Prebuild"
	mono Prebuild.exe /target makefile
	make
}

package() {
	cd "${srcdir}/${pkgname%-*}/Prebuild"
	install -Dm755 "Prebuild.exe" "$pkgdir/usr/lib/prebuild/prebuild.exe"
	install -Dm755 "$srcdir/prebuild.sh" "$pkgdir/usr/bin/prebuild"
	install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/prebuild/COPYING"
	find "$pkgdir/usr/lib/prebuild/" -name '*.dll' -o -name '*.exe' | xargs -rtl1 mono --aot
}
