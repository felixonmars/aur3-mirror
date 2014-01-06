pkgname=moma
pkgver=2.8
pkgrel=4
pkgdesc="The Mono Migration Analyzer (MoMA) tool helps you identify issues you may have when porting your .Net application to Mono."
arch=(any)
url="http://www.mono-project.com/MoMA"
license=("GPL")
source=("http://www.go-mono.com/archive/moma/Moma${pkgver//./-}.zip"
"moma.sh"
"moma-gui.sh"
"MoMA.desktop")
depends=(mono)
makedepends=(dos2unix)
md5sums=('93f0f72a2f5a789716307b98d3ee2dea'
         '6f9853f71827b277c77d4c293b178298'
         '20e1d6bbb92594ac4885be1967dbca55'
         'f03dd0a5e14291cc1cc78032b0211ef0')

package() {
	cd $srcdir
	find . -type f -exec dos2unix {} \;
	mkdir -p "$pkgdir/usr/lib"
	cp -r MoMA "$pkgdir/usr/lib/"
	install -Dm755 "$srcdir/moma.sh" "$pkgdir/usr/bin/moma"
	install -m755 "$srcdir/moma-gui.sh" "$pkgdir/usr/bin/moma-gui"
	install -Dm644 "$srcdir/MoMA.desktop" "$pkgdir/usr/share/applications/MoMA.desktop"
}
