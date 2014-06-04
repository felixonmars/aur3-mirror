# Maintainer: Ernest Ricart <ernest2193@gmail.com>
# Contributor: Joel Almeida <aullidolunar at gmail dot com>

pkgname=futura-theme
pkgver=1.1.0
pkgrel=3
pkgdesc="A theme for GTK3, GTK2, Metacity, xfwm4, openshell, emerald"
arch=('any')
url="http://gnome-look.org/content/show.php/Futura+1.1.0?content=157189"
license=('GPL')
depends=('gtk-engine-unico' 'gtk-engine-murrine' 'gnome-themes-standard')
source=($pkgname-$pkgver.zip::http://fc04.deviantart.net/fs71/f/2013/059/9/1/futura_1_1_0_by_nale12-d5w9ptb.zip)
md5sums=('c1427c86e6b4f96371171bfd5cad3ef4')

build() {
	cd "$srcdir"
}

package() {
	cd "$srcdir"
	find Futura* -type f -exec install -Dm644 {} "$pkgdir/usr/share/themes/{}" \;
}
