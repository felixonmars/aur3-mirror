# Maintainer: Ner0

pkgname=cinnamon-applet-display-switcher
pkgver=1.0
pkgrel=1
pkgdesc="An applet that allows fast switching between several display modes"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/43"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon' 'disper')
source=(http://cinnamon-spices.linuxmint.com/uploads/applets/VZAL-EIZB-13B9.zip)
md5sums=('5aa3fee6f8fd8ac9b25682bf3b127b6f')

package() {
  find rprego\@rprego.com/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
}
