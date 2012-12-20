# Maintainer: Ner0

pkgname=omg-cinnamon-theme
pkgver=1.2
pkgrel=1
pkgdesc="Cinnamon theme that matches omg-suite"
url="http://cinnamon-spices.linuxmint.com/themes/view/58"
license=('GPL')
arch=('any')
depends=('cinnamon')
optdepends=('omg-suite: A matching GTK theme [AUR]')
source=("https://launchpad.net/~bimsebasse/+archive/testing/+files/cinnamon-theme-omg_1.0-0ubuntu1~ppa1.tar.gz")
md5sums=('b617517a36be3fdb0aa8cb6a9cdf4ffd')

package() {
  cd omg-1.0
  find OMG/ -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
