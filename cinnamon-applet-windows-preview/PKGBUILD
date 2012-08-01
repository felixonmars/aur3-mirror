# Maintainer: Ner0

pkgname=cinnamon-applet-windows-preview
pkgver=2.0.1
pkgrel=1
pkgdesc="A window list with window preview applet"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/38"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon')
install=$pkgname.install
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/5OBG-0AJ0-EVCZ.zip")
md5sums=('dd17aea3ec0beeeb377027ccfdfbd343')

package() {
  find windowPreviewWindowList\@dalcde -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
}
