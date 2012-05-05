# Contributor: gareth_c
# Maintainer: Ner0

pkgname=cinnamon-applet-recent
pkgver=1.2
pkgrel=1
pkgdesc="An applet which lists your recently opened documents."
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/3"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon')
source=('http://cinnamon-spices.linuxmint.com/uploads/applets/JZ11-7816-1RRW.zip')
md5sums=('8a7efb7919b98e28b0899a087617eadb')

package() {
  find recent\@cinnamon.org/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
}
