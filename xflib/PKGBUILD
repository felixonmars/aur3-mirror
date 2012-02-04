# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=xflib
pkgver=0.1.7
pkgrel=1
pkgdesc="XF Management Library"
arch=('i686' 'x86_64')
license=('LGPL3')
url="http://www.xfhome.org"
depends=('glibc')
makedepends=('make')
source=(http://xfhome.org/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('81b3194dbdb5fb9fc1497294e460b05c')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/lib
  make || return 1
 }
 package() { 
  cd ${srcdir}/${pkgname}-${pkgver}/lib
  install -D -m644 ${pkgname}.so ${pkgdir}/usr/lib/${pkgname}.so || return 1
  install -D -m644 xf.h ${pkgdir}/usr/include/xflib/xf.h || return 1
  install -D -m644 xf_api.h ${pkgdir}/usr/include/xflib/xf_api.h || return 1
  install -D -m644 xf_conf.h ${pkgdir}/usr/include/xflib/xf_conf.h || return 1
  install -D -m644 hash.h ${pkgdir}/usr/include/xflib/hash.h || return 1
}
