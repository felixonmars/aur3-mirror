# Contributor: gareth_c
# Maintainer: Ner0

pkgname=cinnamon-applet-screenlocker
pkgver=1.0
pkgrel=1
pkgdesc="A simple applet that locks the screen"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/7"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon')
source=('http://cinnamon-spices.linuxmint.com/uploads/applets/PFPL-1QY4-TE0P.zip')
md5sums=('ea964feb901cae5b04c4483f98c1c172')

package() {
  find ScreenLocker\@spacy01/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
}
