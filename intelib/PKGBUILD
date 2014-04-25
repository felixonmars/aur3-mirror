# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=intelib
pkgver=0.6.35
pkgrel=1
pkgdesc="Library of C++ classes which lets you do Lisp programming"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.intelib.org/"
depends=('glibc')
makedepends=('autoconf' 'make')
source=(ftp://ftp.croco.net/intelib/${pkgname}-${pkgver}.tgz)
md5sums=('8a41fe26e6690068e2c4c30b89819b28')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make || return 1
  make PREFIX=/usr DESTDIR=${pkgdir} install || return 1
}
