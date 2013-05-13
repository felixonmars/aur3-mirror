# Maintainer: Maciej Mazur <mamciek@gmail.com>

pkgname=siva-flat-themes
pkgver=1.3.0
pkgrel=3
pkgdesc="A theme for GTK3, GTK2, Metacity, xfwm4, openshell, emerald"
arch=('any')
url="http://gnome-look.org/content/show.php/Siva+Flat+1.3.0?content=156879"
license=('GPL')
depends=('gtk-engine-unico' 'gtk-engine-murrine' 'gnome-themes-standard')
changelog=ChangeLog
md5sums=('5f5b7f3a4e0d10ad01e94aedbb9daf84')

source=($pkgname-$pkgver.zip::http://fc07.deviantart.net/fs70/f/2013/057/9/0/siva_flat_1_3_0_by_nale12-d5ugpl4.zip)

package() {
  cd "$srcdir"
  find Siva* -type f -exec install -Dm644 {} "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:

