#Maintainer: max-k <max-k AT post DOT com>

pkgname=pecl-rsync
_pkgname=rsync
pkgver=0.1.0
pkgrel=2
pkgdesc="Wrapper for librsync library"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/${_pkgname}"
license=('custom')
depends=('php>=5.2.6')
makedepends=('autoconf')
source=(http://pecl.php.net/get/${_pkgname}-${pkgver}.tgz ${pkgname}.install)
md5sums=('413189b50a5f458fdb6b5c011d3faa5f'
         'd3b527f38c6895f36bf548efbf64eb6f')
install=${pkgname}.install

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  phpize || return 1
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make INSTALL_ROOT=${pkgdir} install
  echo ';extension=rsync.so' > ${_pkgname}.ini
  install -D -m644 ${_pkgname}.ini "${pkgdir}/etc/php/conf.d/${_pkgname}.ini"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
