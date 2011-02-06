# Contributor: T - rttommy@gmail.com
pkgname=firefox-beautifier
pkgver=0.2
pkgrel=4
pkgdesc="Beautifies forms and buttons in Firefox/Swiftfox 2"
url="http://code.google.com/p/firefox-beautifier/"
arch=('i686' 'x86_64')
license=('MIT')
source=(http://firefox-beautifier.googlecode.com/files/firefox-beautifier_$pkgver.tar.bz2)
md5sums=('8132270579422f0b89529a1a35e8c3c7')
install=firefox-beautifier.install
build() {
	cd "$startdir/src"
	mkdir -p "$startdir/pkg/usr/share/firefox-beautifier"
	cp -r * "$startdir/pkg/usr/share/firefox-beautifier"
}
