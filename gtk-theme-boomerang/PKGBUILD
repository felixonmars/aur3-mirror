# Maintainer: Nishit Joseph <reachjlight at gmail dot com>
# Contributor: Joel Almeida <aullidolunar at gmail dot c0m>

pkgname=gtk-theme-boomerang
pkgver=5.0
pkgrel=1
pkgdesc="Theme available for GNOME desktop environment (supports Gnome Classic Fallback, Gnome Shell, Unity, metacity and xfwm4)"
arch=('any')
url="http://ghogaru.deviantart.com/art/Boomerang-GTK3-189180645"
license=('GPL3')
depends=('gtk-engines' 'gtk-engine-murrine' 'gtk-engine-unico')
optdepends=(
	'faience-icon-theme: Recommended Icon Theme' 
	'xcursor-vanilla-dmz: Recommended Cursor Theme'
)
source=("http://fc01.deviantart.net/fs70/f/2012/167/b/3/boomerang___gtk3_by_ghogaru-d34mspx.zip")
md5sums=('de353f35965e2a2970b93ac94a142353')

build() {
	cd "$srcdir"
}

package() {
	cd "$srcdir/Boomerang_GTK_by ghogaru"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -dm755 "$pkgdir/usr/share/themes"
	tar xfz "Boomerang.tar.gz" -C "$pkgdir/usr/share/themes"
	tar xfz "Boomerang-Deux.tar.gz" -C "$pkgdir/usr/share/themes"
}
