# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=zukiwi-themes
pkgver=20141018
pkgrel=1
pkgdesc="A theme for GTK3, GTK2, Metacity, xfwm4 and Unity."
arch=('any')
url="http://gnome-look.org/content/show.php/Zukitwo?content=152192"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
optdepends=('gnome-themes-standard: Required for the GTK3 theme'
            'ttf-droid: Font family for the Gnome Shell theme')
source=($pkgname-$pkgver.zip::http://gnome-look.org/CONTENT/content-files/152192-Zukiwi.zip)
sha1sums=('5736e38d3a80a16d701badfcd2d6d52678ea773e')

package() {
  cd "$srcdir"
  find Zukiwi* -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
