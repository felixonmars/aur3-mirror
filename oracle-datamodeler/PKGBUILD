# Maintainer: Jiří Kratochvíl <jshadowsk at gmail dot com>
# Contributor: Rudy Matela <rudy at matela dot com.br>
# Contributor: Gleidson Echeli <gleidson.echeli at gmail dot com>

pkgname=oracle-datamodeler
pkgver=4.0.3.853
pkgrel=1
pkgdesc="A graphical tool for database modeling"
arch=('i686' 'x86_64')
url="http://www.oracle.com/technetwork/developer-tools/datamodeler/overview/index.html"
license=('custom:OTN')
depends=('java-environment' 'bash')
install=oracle-datamodeler.install
source=(manual://datamodeler-$pkgver-$pkgrel.noarch.rpm
        $pkgname.desktop
        $pkgname.sh
        LICENSE-OTN
        java_home.patch)
DLAGENTS+=('manual::/usr/bin/echo The source file for this package needs to be downloaded manually, since it requires a login and is not redistributable.;/usr/bin/echo Please visit http://www.oracle.com/technetwork/developer-tools/datamodeler/overview/index.html.; exit 1;')
sha256sums=('8c57be2183429d9d2f3fac8e4a2887e229df4b436efff85aca7472d4a9c1d5c3'
            '8640ccdd918e70b56017507597b4482b8d8560c7a9ab3ff1b45c79c8e0675aa9'
            'd61ad1cd5f6f6e665471c2b6537654beda625f24a50e19156c4fbbccebc16a24'
            '5919502a2b23a78fff277b642c8b2b989d415dd6de6fb6089424d888809a9257'
            '3093805abc7e7827a5fa16402340e5d14c9c90801c229b1c62d170adece53315')
PKGEXT=".pkg.tar"

package() {
	cd "$srcdir"
	rm -r "$srcdir/usr"
	patch -Np1 < "$srcdir/java_home.patch"

	find . -iname "*.exe" -or -iname "*.dll" -exec rm {} \;
	DIR="$srcdir/opt/datamodeler/"
	find "$DIR" -type f | sed 's:'"$DIR"'::' | while read -r fileInstall; do
		install -Dm644 "$DIR/$fileInstall" "$pkgdir/opt/$pkgname/$fileInstall"
	done
	chmod +x "$pkgdir/opt/$pkgname/datamodeler.sh"
	chmod a+w -R "$pkgdir/opt/$pkgname/datamodeler/types"

	install -Dm755 "$srcdir/$pkgname.sh"      "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/LICENSE-OTN" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-OTN"
}

