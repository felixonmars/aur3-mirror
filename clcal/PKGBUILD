# Creator: Peter Feigl <craven@gmx.net>
pkgname=clcal
pkgver=0.20
pkgrel=1
pkgdesc="a command-line calendar"
arch=('i686' 'x86_64')
url="http://www.hyborian.demon.co.uk/clcal/download.html"
license=('GPL2')
builddepends=('make')
source=(http://www.hyborian.demon.co.uk/clcal/files/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -i 's/CFLAGS = "-Wall -O3"/CFLAGS=-Wall -O3/' Makefile
  make || return 1
  mkdir -p ${pkgdir}/usr/bin/
  install clcal ${pkgdir}/usr/bin/
}
md5sums=('7f5e135ef3a768a7027a89583b57aba7')
