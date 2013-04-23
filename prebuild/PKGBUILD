# Contributor: Sacro <ben at benwoodward dot me dot uk>
pkgname=prebuild
pkgver=2.0.3
pkgrel=5
pkgdesc="A cross-platform XML-driven pre-build tool which allows developers to easily generate project files for major IDE's and .NET development tools"
arch=(i686 x86_64)
url="http://mono-project.com/Prebuild"
license=("BSD")
source=("http://downloads.sourceforge.net/dnpb/Prebuild-$pkgver.zip"
"prebuild.sh")
depends=(mono)
conflicts=(prebuild-svn)
md5sums=('865f360d2e94cb62e0c4ba1191dd6dc5'
         '7388c48bf6c80b6b5d96f844f7fb2a62')

build() {
	cd "Prebuild-$pkgver"
	mono Prebuild.exe /target autotools
	cd "autotools/Prebuild"
	sh autogen.sh --prefix=/usr
	make
}

package() {
	cd "Prebuild-$pkgver/autotools/Prebuild"
	make DESTDIR=$pkgdir install
	install -Dm755 "$srcdir/prebuild.sh" "$pkgdir/usr/bin/prebuild"
	install -Dm644 "../../COPYING" "$pkgdir/usr/share/licenses/prebuild/COPYING"
	find "$pkgdir/usr/lib/prebuild/" -name '*.dll' -o -name '*.exe' | xargs -rtl1 mono --aot
}
