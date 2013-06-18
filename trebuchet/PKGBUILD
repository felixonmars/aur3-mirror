# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Glen Oakley <goakley123@gmail.com>
pkgname=trebuchet
pkgver=1.075
pkgrel=1
epoch=
pkgdesc="A client program for connecting to TinyMUD style social MUD servers"
arch=('any')
url="http://www.belfry.com/fuzzball/trebuchet/"
license=('GPL')
groups=()
depends=('tk')
makedepends=()
checkdepends=()
optdepends=()
provides=('treb')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname-$pkgver.tar.gz treb.desktop treb.png)
noextract=()
md5sums=('f0e48e2a370ef196747be0043f28a6ca'
         '3527b0aeb1b8140541664f00fa7ab892'
         '9584f7c9d7144f78f1ea203a12631a19') #generate with 'makepkg -g'

build() {
	cd "$srcdir/$pkgname-$pkgver"
}

package() {
	mkdir -p "$pkgdir/opt/"
	cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"
	mkdir -p "$pkgdir/usr/bin/"
	ln -s "/opt/$pkgname/Trebuchet.tcl" "$pkgdir/usr/bin/treb"
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$srcdir/treb.desktop" "$pkgdir/usr/share/applications/"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/192x192/apps"
	cp "$srcdir/treb.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/"
}
