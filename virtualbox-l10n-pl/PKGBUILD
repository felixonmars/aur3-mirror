# Maintainer: FadeMind <fademind@gmail.com>

pkgname=virtualbox-l10n-pl
pkgver=1.0
pkgrel=1
pkgdesc="Polish language pack for Virtualbox"
arch=('any')
url="https://www.virtualbox.org/"
license=('GPL')
depends=('virtualbox')
source=("virtualbox-l10n-pl.tar.gz::https://copy.com/7RfsgGc36HXspO7L%2Fvirtualbox-l10n-pl.tar.gz?download=1")
sha256sums=('a4f874d3be6bad77ca2c63b7a5f41cd55546c0273dbda342a30735f6aa730237')
package() {
  	cd "$srcdir"
	find *.qm -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/virtualbox/nls/{}" \;
}  
