# Maintainer: Austin <doorknob60 at gmail dot com>
# Contributor: Marcelo A. B. Slomp <mslomp@archlinux.com.br>

pkgname=z26
pkgver=3.02
pkgrel=1
pkgdesc="An Atari 2600 Emulator"
arch=("i686" "x86_64")
url="http://www.whimsey.com/z26/z26.html"
depends=('sdl')
license=('GPL')
source=("http://www.whimsey.com/z26/z26v${pkgver}.01s.zip" "z26.desktop")
md5sums=('5c28a898a6a6145c222a8f0b5c8ce8d6'
         '2c262951e363fa9a70ca4acd119b9894')

build() {
	cd "$srcdir/src"
	make linux
}

package() {
	install -d $pkgdir/{usr,usr/bin,usr/share,usr/share/pixmaps,usr/share/applications}
	install -Dm755 "$srcdir/src/z26" "$pkgdir/usr/bin"
	install -D "$srcdir/src/z26_icon.png" "$pkgdir/usr/share/pixmaps/z26.png"
	install -D "$srcdir/z26.desktop" "$pkgdir/usr/share/applications"
}
