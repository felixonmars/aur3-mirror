# Maintainer: Ernest Ricart <ernest2193@gmail.com>

pkgname=futura
pkgver=1.1.0
pkgrel=2
pkgdesc="A theme for GTK3, GTK2, Metacity, xfwm4, openshell, emerald"
arch=('any')
url="http://gnome-look.org/content/show.php/Futura+1.1.0?content=157189"
license=('GPL')
depends=('gtk-engine-unico' 'gtk-engine-murrine' 'gnome-themes-standard')
changelog=ChangeLog
md5sums=('c1427c86e6b4f96371171bfd5cad3ef4')

source=($pkgname-$pkgver.zip::http://www.deviantart.com/download/356531951/futura_1_1_0_by_nale12-d5w9ptb.zip)

package() {
  cd "$srcdir"
  find Futura* -type f -exec install -Dm644 {} "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:

