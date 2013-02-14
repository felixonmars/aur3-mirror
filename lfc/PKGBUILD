# Maintainer: Fat Cat <carlos dot manuel250 at gmail dot com>
# Contributor: Estevao Valadao <estevao@archlinux-br.org>

pkgname=lfc
pkgver=1.4.1
pkgrel=1
pkgdesc="A collection of basic C++ classes for encapsulation of low level OS calls"
arch=('i686' 'x86_64')
url="http://www.lemke-it.com/"
license=('GPL')
depends=('gcc-libs')
source=(http://www.lemke-it.com/${pkgname}-${pkgver}.tar.gz)

sha256sums=('05e7ebff920ab7f29a660f9764695a2f30b265e23c1de4b3c6f3b579179dde69')
sha512sums=('f31a94b55880ac0ec3ad03d0283372d43aba635824326ebc6e21637046f61bb18b5f2887ccd1fd2738b3627bf117a9159339cfb2d1be68f0e6fbc7a23c2c6029')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  if [ "${CARCH}" = "x86_64" ]; then 
    export ac_cv_func_malloc_0_nonnull=yes
  fi
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}