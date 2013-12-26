# Maintainer: Paul Dufrese <dufresnep@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Johannes Krampf <mail@johkra.de>

pkgname=cobra
pkgver=0.9.6
pkgrel=3
epoch=2
pkgdesc="Clean and expressive language for .NET and Mono"
arch=('any')
options=('!strip')
url="http://cobra-language.com/"
license=('custom:MIT')
depends=(mono)
install=cobra.install
source=(http://cobra-language.com/downloads/Cobra-$pkgver.tar.gz install.patch)
sha512sums=('9fbf5ffb35db3895d74176013f023e6f3c390bc0208a6e02aed6f9f168a85f03b85026452ffe03354b502682803479fb49e429ab3411cf40e477f813d87caf52'
            '3a53e7227f0c4f490ad4499a16b4ba1de31823ab23e5dd0da9a8820859d6865e5d97f43448cf771412fb31a3aed5a62a66106f5a474d068f02b8a45ab231d8e2')

prepare() {
	cd Cobra-$pkgver
	patch -p1 < "$srcdir"/install.patch

	cd Source
	echo "$pkgdir"/opt/cobra > install-directory.text

	sed -i "s|\$(MSBuildExtensionsPath)|$pkgdir/usr/lib/mono/xbuild|" Cobra.MSBuild/Targets/Cobra.targets
}

package() {
	cd Cobra-$pkgver/Source

	yes | bin/install-from-workspace

	cd "$pkgdir"

	sed -i "s|$pkgdir||" opt/cobra/bin/cobra

	install --directory usr/bin
	ln -s /opt/cobra/bin/cobra usr/bin/cobra

	install --directory usr/share/licenses/$pkgname
	cp "$srcdir"/Cobra-$pkgver/License.text usr/share/licenses/$pkgname/
}
