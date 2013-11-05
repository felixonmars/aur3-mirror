# Maintainer: David Roheim <david dot roheim at gmail dot com>

pkgname=('php-varnish')
_pkgname=varnish
pkgver=1.1.1
pkgrel=1
pkgdesc="Varnish Cache bindings"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/varnish"
license=('PHP')
depends=('php>=5.3')
makedepends=('varnish')
install=${pkgname}.install
source=("http://pecl.php.net/get/${_pkgname}-${pkgver}.tgz"
        "${_pkgname}.ini")
backup=(etc/php/conf.d/${_pkgname}.ini)
sha256sums=('c5df396751f73050b8a8b1e50a2ce180ed8dfcdb8fd22056b775213b00ead898'
            '736f54bd8520a310a92446730713c6bc47a69d5c839a5fa806d3dfb4e32661a3')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  phpize
  ./configure --prefix=/usr
  make
}

test() {
	make test
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 ${srcdir}/${_pkgname}.ini ${pkgdir}/etc/php/conf.d/${_pkgname}.ini
}

# vim:set ts=2 sw=2 et: