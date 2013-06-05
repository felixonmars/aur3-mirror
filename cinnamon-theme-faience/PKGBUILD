# Maintainer: achterin

pkgname=cinnamon-theme-faience
pkgver=1.1.1
pkgrel=1
pkgdesc="Cinnamon theme made from the original Faience Gnome Shell Theme"
url="http://cinnamon-spices.linuxmint.com/themes/view/124"
license=('GPL')
arch=('any')
depends=('cinnamon')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/3DFL-U5RG-5EJZ.zip")
md5sums=('75bd0309482922253ec4550fad1f5abb')

package() {
  find Faience/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
