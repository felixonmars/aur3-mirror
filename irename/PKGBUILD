# Maintainer: Vojtech Kral <vojtech () kral.hk>

pkgname=irename
pkgver=0.1
pkgrel=1
pkgdesc="Interactive Rename - rename files in place, making it easy to adjust long filenames"
arch=('any')
url="https://github.com/vojtechkral/irename"
license=('BSD')
depends=('python' 'readline')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vojtechkral/irename/archive/${pkgver}.tar.gz")
sha256sums=('640817233f9f4bb58175505f0cbd919ba57cdf4e639e04cfd1290e53f5eee840')

package()
{
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m 755 'ir' "$pkgdir/usr/bin/ir"
}

# vim:set ts=2 sw=2 et:
