# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=cinnamon-theme-white
pkgver=1.6.2
pkgrel=1
pkgdesc="White theme for Cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/147"
license=('unknown')
depends=('cinnamon' 'cantarell-fonts')
source=('http://cinnamon-spices.linuxmint.com/uploads/themes/4NKA-FF9H-PCZ2.zip')

package() {
  cd "$srcdir"
  find White* -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

sha256sums=('bcbf7f352a4349baeb72ba6ebd10641be5033361e4d1e9c80750ab425ca1318c')
