# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname='facebook-utils'
pkgver=8
pkgrel=1
pkgdesc="Some commands for working with facebook"
arch=('any')
url="http://bauer.dnsdojo.com/Projects/facebook-utils"
license=('custom')
source=('facebook-list-friends')
provides=('facebook-list-friends')
depends=('bash' 'curl')
md5sums=('4e6da70d24a5632a08a3a0b79b06d318')

build() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$source" "$pkgdir/usr/bin"
}
