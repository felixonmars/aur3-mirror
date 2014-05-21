# Maintainer: Tom Swartz <tom.swartz07@gmail.com>

pkgname=nodejs-uncss
_npmname=uncss
pkgver=0.7.4
pkgrel=2
pkgdesc="A tool that removes unused CSS from your stylesheets"
arch=('any')
depends=('nodejs')
url="https://github.com/giakki/uncss"
license=('MIT')
provides=('uncss')

package() {
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
