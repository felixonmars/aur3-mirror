# Maintainer: OmeGa <omega at mailoo dot org>

pkgname=cinnamon-theme-glass
_file=SMIN-LM7F-F8JZ
pkgver=90
pkgrel=1
pkgdesc="Glass Fedora, Mint & Ubuntu themes for Cinnamon."
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/150"
license=('unknown')
depends=('cinnamon' 'ttf-ubuntu-font-family')
source=($pkgname-$pkgver.zip::http://cinnamon-spices.linuxmint.com/uploads/themes/$_file.zip)
sha1sums=('a577a42cf9123305b56bb429ec93149fc9e1dd6b')

package() {
  cd "$srcdir"
  find Glass* -type f -exec install -Dm644 {} "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:
