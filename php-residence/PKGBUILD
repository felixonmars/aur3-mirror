pkgname=php-residence
pkgver=1.3.1
pkgrel=1
pkgdesc="A php software to manage hotel reservations and booking"
arch=('i686' 'x86_64')
url=("http://www.digitaldruid.net/php-residence/")
license=('GPL')
depends=('php' 'mysql')
optdepends=('apache: Web server to run wordpress' 'cherokee: Lightweight Web server to run wordpress')
install=${pkgname}.install
source=(http://www.digitaldruid.net/download/${pkgname}_${pkgver}.tar.gz)
md5sums=('c0cb946f09e17c1e499c5c6d39b798d8')

build() {
	install -d ${pkgdir}/srv/http/php-residence
        cp -r ${srcdir}/php-residence/* ${pkgdir}/srv/http/php-residence

}
