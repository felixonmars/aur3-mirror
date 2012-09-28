# Maintainer: Ner0

pkgname=cinnamon-applet-gnome-menu
pkgver=2.3.2
pkgrel=1
pkgdesc="An applet that brings back the GNOME-2 menus"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/51"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon' 'python2')
install=$pkgname.install
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/V01F-11RH-3SJZ.zip")
md5sums=('b35ae7eda14839298b38ecbe0d12528e')

package() {
  cd GnomeApplets/Linux\ Mint\ Applets/

  for i in *\@bownz; do
    find "$i" -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
  done

  install -Dm644 *.xml "$pkgdir/usr/share/glib-2.0/schemas/org.cinnamon.applets.GnomeMenu.gschema.xml"

  find "$pkgdir/" -name *.py -exec sed -i 's/python$/python2/' '{}' \;
}
