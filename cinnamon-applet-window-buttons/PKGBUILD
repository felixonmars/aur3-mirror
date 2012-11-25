# Maintainer: ValHue

pkgname=cinnamon-applet-window-buttons
pkgver=1.0
pkgrel=1
pkgdesc="A Cinnamon applet that adds window buttons to the panel. Based on the Window Buttons Gnome Shell extension by biox."
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/67"
license=('GPL3')
depends=('cinnamon')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/G29D-KX91-3D6A.zip")
md5sums=('c1b193dc676fa1f800be1ede5eab075f')

package() {
  find windowButtons\@lippy/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;

  install -Dm644 *.xml "$pkgdir/usr/share/glib-2.0/schemas/org.cinnamon.applets.windowButtons@lippy.gschema.xml"    
}
