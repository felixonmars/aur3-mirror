#Maintainer: Black_codec <orso.f.regna@gmail.com>
pkgname=izulu
pkgver=0.4.1
pkgrel=2
pkgdesc="A script which changes the background of your GNU/Linux-Desktop according to the weather."
url="https://github.com/onli/izulu"
license=('GPL')
depends=('bash' 'xmlstarlet' 'imagemagick' 'wget' 'perl-xml-twig')
makedepends=('unzip')
install=${pkgname}.install
source=('https://github.com/onli/${pkgname}/archive/master.zip')
arch=('i686' 'x86_64')
md5sums=('e81984067df1d2ab15eb6dd5ddea12cd')

build() {
	cd "$srcdir/$pkgname-master"
	make
}
package() {
	cd "${srcdir}/${pkgname}-master"
	make DESTDIR="$pkgdir" install
}
