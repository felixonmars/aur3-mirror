# Contributor: Meow < meow at linux dot cn >

pkgname=proxychains-gui
pkgver=1.4.1
pkgrel=2
pkgdesc="A free graphical user interface using Qt for ProxyChains."
url="http://proxychains.sourceforge.net/"
depends=('qt' 'proxychains')
arch=('i686' 'x86_64')
license=('GPL')
conflicts=()
_pkgname='ProxyChainsGUI'
source=("http://qt-apps.org/CONTENT/content-files/138690-${_pkgname}_${pkgver}.tar.gz"
		"proxychains-gui.desktop")
md5sums=('3fcde0c3c786161584e91bf77c31cade'
		 '3f8459b2ed6517f49055edf3b2b09183')

build() {
	cd "$srcdir"/${_pkgname}_${pkgver}
	#qmake PREFIX=/root/to/install proxychainsgui.pro
	qmake PREFIX="$pkgdir" proxychainsgui.pro
	make || return 1
}

package() {
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/usr/share/icons/hicolor/48x48/apps/
	mkdir -p "$pkgdir"/usr/share/applications

	cd "$srcdir"/${_pkgname}_${pkgver}/src
	cp ProxyChainsGUI "$pkgdir"/usr/bin
	cp ./images/icon.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/proxychains-gui.png
	cp "$srcdir"/proxychains-gui.desktop "$pkgdir"/usr/share/applications
}
