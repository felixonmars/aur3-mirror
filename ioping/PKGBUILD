# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=ioping
pkgver=0.6
pkgrel=1
pkgdesc=" A simple disk I/0 latency measuring tool"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://ioping.googlecode.com"
depends=('glibc')
source=(http://ioping.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('f96b382a6517c7eac744291b04b928b1')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make PREFIX=/usr || return 1
  #install -m755 -D ${pkgname} ${pkgdir}/usr/bin/${pkgname} || return 1
  #install -m644 -D ${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1 || return 1
  make PREFIX=$pkgdir/usr install || return 1
}
