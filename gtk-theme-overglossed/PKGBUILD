# Contributor: Calimero <calimeroteknik@free.fr>

pkgname=gtk-theme-overglossed
pkgver=0.1
pkgrel=1
pkgdesc="Overglossed GTK 2.0 dark theme"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2')
url=('http://www.gnome-look.org/content/show.php/Overglossed?content=74813')
source=(http://www.gnome-look.org/CONTENT/content-files/74813-Overglossed.tar.gz)
md5sums=('4f5d69a45967f95170e8f0843b2f6380')

package() {
  mkdir -p "$pkgdir/usr/share/themes/Overglossed"
  cp -r "$srcdir/Overglossed/gtk-2.0" "$pkgdir/usr/share/themes/Overglossed/"
  cp "$srcdir/Overglossed/index.theme" "$pkgdir/usr/share/themes/Overglossed/"
}
