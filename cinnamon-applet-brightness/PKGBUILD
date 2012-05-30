# Maintainer: ansgras
pkgname=cinnamon-applet-brightness
pkgver=1.0.2
pkgrel=1
pkgdesc="An app to control xgamma brightness under Cinnamon."
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/44"
license=('GPL')
depends=('cinnamon')
source=('http://cinnamon-spices.linuxmint.com/uploads/applets/CCPM-BFGN-6PG7.zip')
md5sums=('2dd538f27cc93a53800f6d509bc2991e')

package() {
  find brightness\@markbokil.com/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
}

