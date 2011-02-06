# $Id: PKGBUILD,v 1.3 2006/05/27 06:48:00 andyrtr Exp $
# Maintainer: roberto <roberto@archlinux.org>
# Contributor: Sebastian Sariego B. <seba@craftlink.org>
# Mantainer: Roberto Carvajal <roberto@archlinux.org>
# Maintainer: Nathan O <ndowens.aur at gmail dot com>

pkgname=ippl
pkgver=1.4.14
pkgrel=5
pkgdesc="IP Protocols Logger"
arch=('i686' 'x86_64')
license=('GPL')
url="http://pltplp.net/ippl/"
depends=('glibc')
source=(http://pltplp.net/ippl/archive/${pkgname}-${pkgver}.tar.gz)
md5sums=('9abd0f77e118c3ddf6805e2de73ed56a')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make 
  make DESTDIR=${pkgdir} install
}
