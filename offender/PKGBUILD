# Maintainer: kfgz <kfgz at interia pl>
# Contributor: Dominika Solarz <dominikasolarz at gmail dot com>

pkgname=offender
pkgver=0.2
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="An entertaining 2d space shooter."
license="GPL"
url="http://offender.sourceforge.net"
depends=('gtk')
source=(${pkgname}-${pkgver}.tar.gz::http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgname}%20${pkgver}/${pkgname}-${pkgver}.tar.gz/download)
md5sums=('f65ff48b54fdff76170ec7c823fe120c')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  aclocal -I config
  autoheader && automake --gnu --add-missing && autoconf
  ./configure --prefix=${pkgdir}/usr --exec-prefix=${pkgdir}/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make install
}