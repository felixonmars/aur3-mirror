# Maintainer: Maciej Mazur <mamciek@gmail.com>

pkgname=siva-themes
pkgver=1.0.0
pkgrel=1
pkgdesc="A theme for GTK3, GTK2, Metacity, xfwm4, openshell, emerald"
arch=('any')
url="http://gnome-look.org/content/show.php/Siva_1.0.0?content=156783"
license=('GPL3')
depends=('gtk-engine-unico' 'gtk-engine-murrine' 'gnome-themes-standard')
source=($pkgname-$pkgver.zip::http://www.deviantart.com/download/352787657/siva_1_0_0_by_nale12-d5u1gp5.zip)
md5sums=('bf6c9bd7333ee9f880ed7f3e6077310d')

package() {
  cd "$srcdir"
  find Siva* -type f -exec install -Dm644 {} "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:
