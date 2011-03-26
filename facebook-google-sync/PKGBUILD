# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname='facebook-google-sync'
pkgver=8
pkgrel=1
pkgdesc='Sync Facebook Friends with Google Contacts'
arch=('any')
url="http://bauer.dnsdojo.com/Projects/$pkgname"
license=('custom')
source=('facebook-google-sync')
depends=('sh' 'facebook-utils>=7' 'google-contacts-utils')
md5sums=('c48f2f0c8718ba0793eda9625c074898')

build() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$source" "$pkgdir/usr/bin"
}
