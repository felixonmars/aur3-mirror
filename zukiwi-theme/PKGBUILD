# Maintainer: bwat47 <bwat47 at gmail dot com>

pkgname=zukiwi-theme
pkgver=20120817
pkgrel=1
pkgdesc="A gtk2, gtk3, metacity, gnome-shell and unity theme..."
arch=('any')
url="http://gnome-look.org/content/show.php/Zukiwi?content=152192"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine' 'gtk-engine-unico>=1.0.2')
source=("${pkgname}-${pkgver}.zip::http://gnome-look.org/CONTENT/content-files/152192-Zukiwi.zip")
md5sums=('c2a078d5c2c1792437a4fbbe4ccea1c0')


package() {

  # install theme
  find Zukiwi/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:
