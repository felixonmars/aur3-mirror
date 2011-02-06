# $Id: PKGBUILD 9006 2010-01-23 02:59:46Z dgriffiths $
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
pkgname=libscigraphica
pkgver=2.1.1
pkgrel=3
pkgdesc="Supporting library for scigraphica"
arch=('i686' 'x86_64')
url="http://scigraphica.sourceforge.net/"
license=('GPL')
depends=('gtk2+extra>=2.1.1' 'python-numarray' 'libxml2' 'perlxml')
makedepends=()
options=('!libtool')
source=(http://downloads.sourceforge.net/scigraphica/${pkgname}-${pkgver}.tar.gz)
md5sums=('1966786bcc8c47036e35777cbda422c3')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-python-numeric-path=/usr/include/python2.5/numarray
  make || return 1
  make DESTDIR=${pkgdir} install
}
# vim:syntax=sh
