# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: 

pkgname=nodejs-minimist
_npmname=minimist
pkgver=1.1.1
pkgrel=1
pkgdesc="Parse argument options"
arch=('any')
url="https://github.com/substack/minimist"
license=('MIT')
depends=('nodejs')
provides=('nodejs-minimist')
source=("${_npmname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e87216c365915b29450320ab7a553d8d612908fecf632e88dbfa69a8eff7a484')

package() {
	cd "$_npmname-$pkgver"

	install -d "$pkgdir/usr/lib/node_modules/$_npmname"

	cp -pr * "$pkgdir/usr/lib/node_modules/$_npmname"

	install -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	rm -f "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE"
}
