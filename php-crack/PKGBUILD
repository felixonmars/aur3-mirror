# Contributor: Matteo Mattei <matteo.mattei@gmail.com>

pkgname=php-crack
pkgver=0.4
pkgrel=2
pkgdesc="This package provides an interface to the cracklib (libcrack) libraries that come standard on most unix-like distributions."
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/crack"
license=('PHP')
depends=('php' 'cracklib')
source=(http://pecl.php.net/get/crack-${pkgver}.tgz)
md5sums=('7cfe9df99f546cf6bd55b535d71e3b1f')

build() {
  cd ${srcdir}/crack-${pkgver}
  phpize || return 1
  ./configure --prefix=/usr --with-crack
  make
  make INSTALL_ROOT=${pkgdir} install
}
