# Maintainer: Jakob Matthes <jakob.matthes@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=roll
pkgver=2.0.1
pkgrel=1
pkgdesc="A tool to roll a user-defined dice sequence and display the result"
arch=('i686' 'x86_64')
url="http://matteocorti.ch/software/roll.html"
license=('GPL2')
source=(http://matteocorti.ch/software/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d0bc4d0d3bbd984566d331041e1507a8')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
