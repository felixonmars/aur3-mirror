# Maintainer: SuperBo <supernbo at gmail dot com>
# Contributor: Berseker <berseker86 at gmail dot com
# Based on nuovegnomegray PKGBUILD by 3V0LU710N <db_eee at yahoo dot com>

pkgname=nouvegnome-icon-theme
pkgver=20140227
pkgrel=2
pkgdesc="nouveGnome is a colorful icon set compatible with most light GTK themes."
arch=('any')
makedepends=('p7zip')
optdepends=('adwaita-icon-theme: Adwaita icon theme')
url="http://gnome-look.org/content/show.php/nouveGnome?content=125474"
license=('GPL')
source=(http://fc01.deviantart.net/fs70/f/2014/057/f/2/nouvegnome_by_tsujan-d4zkn9v.7z)
sha256sums=('b90af96846de5063fd8fbd5c515e71a627711ee224e107725a9bbcc6ed7ea65f')

package()
{
 cd "$srcdir"
 mkdir -p "$pkgdir/usr/share/icons/"
 cp -a "nouveGnome" "$pkgdir/usr/share/icons/"
 find "$pkgdir/usr/share/icons" -type d -exec chmod 755 {} \;
 find "$pkgdir/usr/share/icons/nouveGnome" -type f -exec chmod 644 {} \;
}

