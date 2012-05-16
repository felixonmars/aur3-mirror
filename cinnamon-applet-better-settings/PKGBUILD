# Maintainer: Ner0

pkgname=cinnamon-applet-better-settings
pkgver=1.1.1
pkgrel=1
pkgdesc="A settings applet with additional features like Reload Theme, Force Quit, Take Screenshot etc."
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/36"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon')
optdepends=('gnome-utils: for taking screenshots')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/FTBL-QMQO-FG7Q.zip")
md5sums=('cb9393243bfc9bb08a75a5dfa2b2d44b')

package() {
  find bettersettings\@bownz/ -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;

  sed -i 's/python/python2/' "$pkgdir/usr/share/cinnamon/applets/bettersettings@bownz/xkill.py"
}
