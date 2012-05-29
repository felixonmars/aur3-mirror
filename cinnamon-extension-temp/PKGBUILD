# Maintainer: ansgras
pkgname=cinnamon-extension-temp
pkgver=1.2
pkgrel=1
pkgdesc="Display Temperature of acpi on cinnamon."
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/72"
license=('GPL')
depends=('cinnamon')
source=('http://cinnamon-spices.linuxmint.com/uploads/applets/SOQ4-EB7J-D0IS.zip')
md5sums=('323ae9430317d0106c04533fc15354a5')

package() {
  find temperature\@xtranophilist/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/extensions/{}" \;
}

