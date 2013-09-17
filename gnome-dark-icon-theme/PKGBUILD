# Maintainer: BlackICE <manfredi at gmail.com>
# Contributor: SmiL3y <xakepa10@gmail.com>

pkgname=gnome-dark-icon-theme
pkgver=5.5.1
pkgrel=5
pkgdesc="Black and very dark grey version of GNOME-Colors's"
arch=('any')
url="http://anonymous-bot.deviantart.com/gallery/453398"
license=('GPL')
depends=('gnome-colors-icon-theme')
makedepends=('p7zip')
source=("http://lara.craft.net.br/Gnome_darker_by_anonymous_bot.7z"
        "http://lara.craft.net.br/Gnome_dark_by_anonymous_bot.7z")
noextract=(${source[@]%%::*})
md5sums=('a87211dad31bcdfefee9174ab2a8152a'
         '37871d372992fad07cd45da47188f9a2')

prepare() {
	cd "$srcdir"
	7z x -y Gnome_darker_by_anonymous_bot.7z
	7z x -y Gnome_darker_by_anonymous_bot.7z
}

package() {
    mkdir -p "$pkgdir/usr/share/icons"
	cd "$srcdir"
    mv -f "gnome-dark" "$pkgdir/usr/share/icons"
    mv -f "gnome-darker" "$pkgdir/usr/share/icons"
}

