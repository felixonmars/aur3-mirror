# Maintainer: Ner0

pkgname=cinnamon-applet-usermenu
pkgver=2.2.2
pkgrel=1
pkgdesc="An indicator applet that adds the User menu options"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/45"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon' 'python2')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/SXK1-1QAA-JHUQ.zip")
md5sums=('0436a40dad28bf81ee5a9f0c88a31aff')

package() {
  find UserMenuV2\@bownz -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;

  sed -i 's/python/python2/' "$pkgdir/usr/share/cinnamon/applets/UserMenuV2@bownz/ShutdownMenuFixed.py"
}
