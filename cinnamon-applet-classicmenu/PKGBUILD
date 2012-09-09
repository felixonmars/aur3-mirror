# Maintainer: Ner0

pkgname=cinnamon-applet-classicmenu
pkgver=2.6.9
pkgrel=2
pkgdesc="An applet that adds the Classic Mint menu"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/46"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon' 'python2')
install=$pkgname.install
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/1FR4-PF8U-QF7E.zip")
md5sums=('dcc606cfba0f313d89205b0431241a91')

package() {
  cd $pkgver

  find classicMenu\@dalcde -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;

  sed -i 's/<default>$/<\/default>/' *.xml

  install -Dm644 *.xml "$pkgdir/usr/share/glib-2.0/schemas/org.cinnamon.applets.classicMenu.gschema.xml"

  sed -i 's/env\ python.*/env\ python2/' "$pkgdir"/usr/share/cinnamon/applets/classicMenu@dalcde/*.py
}
