# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=xcursor-haikuhand
pkgver=0.5
pkgrel=1
pkgdesc="Port of cursor theme from Haiku"
url="http://gnome-look.org/content/show.php/HaikuHand?content=116169"
arch=('any')
license=('GPL')
source=("http://gnome-look.org/CONTENT/content-files/116169-HaikuHand-${pkgver}.tar.bz2")
sha1sums=('56ccd65f82b86c61b9236727ed8b4f63fc443ad1')

package() {
  install -D -d -m755 ${pkgdir}/usr/share/icons
  tar xf 116169-HaikuHand-${pkgver}.tar.bz2 -C ${pkgdir}/usr/share/icons
}
