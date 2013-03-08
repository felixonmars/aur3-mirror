# Contributor: Kamikaze84
# Maintainer: Kamikaze84

pkgname=cinnamon-applet-path-monitor
pkgver=0.9
pkgrel=1
pkgdesc="An applet that monitors a specified path and allows opening its contents with the default launcher."
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/99"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/KZFZ-K201-TVSX.zip")
md5sums=('332a5842a3b120f19eb28d1c63eea269')

package() {
  find path-monitor\@kamikaze/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
}
