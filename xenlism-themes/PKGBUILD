# Maintainer: xenatt <exenatt {at} gmail {dot} com>
# Contributor: xenatt <exenatt {at} gmail {dot} com>

pkgname=xenlism-themes
pkgver=20140424
pkgrel=1
pkgdesc="A Minimal theme for GTK3, GTK2, Metacity,Gnome Shell"
arch=('any')
url="https://github.com/xenatt/Linux/"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
optdepends=('gnome-themes-standard: Required for the GTK3 theme'
            'ttf-droid: Font family for the Gnome Shell theme')
source=($pkgname-$pkgver.zip::https://github.com/xenatt/Linux/raw/master/Themes/gnome/xenlism-gnome-shell.zip)
sha1sums=('SKIP')

package() {
  cd "$srcdir"
  find xenlism -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:
