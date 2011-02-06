# Contributor: Jakub Drabek <jakubdrabek@gmail.com>
pkgname=wklejarka
pkgver=2007111500
pkgrel=2
pkgdesc="nopaste.pl submitter"
arch=('i686' 'x86_64')
url="http://nopaste.pl"
license=('GPL')
depends=("python")
source=(http://nopaste.pl/download/$pkgname-$pkgver.gz)
md5sums=('a7afa8d3169c1541824c62416e246f85')

build() {
install -Dm 755 ${startdir}/src/${pkgname}-${pkgver} ${startdir}/pkg/usr/bin/${pkgname} || return 1
}
