# Maintainer: Ner0

pkgname=cinnamon-extension-cinnadock
pkgver=0.4
pkgrel=1
pkgdesc="A dock extension for Cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/extensions/view/6"
license=('GPL3')
depends=('cinnamon')
install=$pkgname.install
source=(http://cinnamon-spices.linuxmint.com/uploads/extensions/PKWH-PWYC-MZGS.zip)
md5sums=('a3c7384c06fae03a882ab84f171ada98')

package() {
  find cinnadock@in-progress.org/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/extensions/{}" \;

  install -Dm644 *.xml "$pkgdir/usr/share/glib-2.0/schemas/org.cinnamon.extensions.cinnadock.gschema.xml"
}
