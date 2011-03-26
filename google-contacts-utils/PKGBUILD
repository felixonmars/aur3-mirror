# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname='google-contacts-utils'
pkgver=4
pkgrel=1
pkgdesc="Some commands for working with Google Contacts"
arch=('any')
url="http://bauer.dnsdojo.com/Projects/$pkgname"
license=('custom')
source=('google-contacts-add')
depends=('bash' 'curl')
md5sums=('2860da2c5b943f5737baa3cd4019c087')

build() {
	mkdir -p $pkgdir/usr/bin
	cp $source $pkgdir/usr/bin
}
