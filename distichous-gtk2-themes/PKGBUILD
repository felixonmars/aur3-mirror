# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>

pkgname=distichous-gtk2-themes
pkgver=20121010
pkgrel=1
pkgdesc="A theme for GTK2 and Metacity"
arch=('any')
url="http://gnome-look.org/content/show.php/Zukitwo?content=140562"
license=('GPL3')
depends=('gtk-engine-murrine')
source=($pkgname-$pkgver.zip::http://www.deviantart.com/download/182406956/distichous_gtk_by_jurialmunkey-d30lm3w.zip)
sha1sums=('99c26d5902f55bbdffb2e1a9f248c91a4c102e8a')

package() {
  cd "$srcdir"
  find Distichous* -type f -exec install -Dm644 {} "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:

