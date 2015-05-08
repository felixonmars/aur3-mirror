#Xolonium Fonts created for Xonotic <http://www.xonotic.org>
#Maintainer: Halogene <halo hyphen gene at freenet dot de>
#Contributor: Fonts originally by sev <sev dot ch at web dot de>
pkgname=xolonium-fonts
pkgver=3.0
pkgrel=2
pkgdesc="Xolonium Fonts created for Xonotic <http://www.xonotic.org>"
url="http://openfontlibrary.org/font/xolonium"
arch=(any)
license=('GPL')
source=("http://openfontlibrary.org/assets/downloads/xolonium/66b0a5c16d6ca923565eb0758888aa29/xolonium.zip")
sha256sums=('c04932935226a1f6c470083c821143c0ff91b6d52c17b3125ae9f19cedab65de')
install=$pkgname.install

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$srcdir/$pkgname-3.0/fonts/"*.otf "$pkgdir/usr/share/fonts/TTF/"
}
