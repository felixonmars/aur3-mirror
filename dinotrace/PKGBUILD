# Maintainer: kfgz <kfgz at interia dot pl>

pkgname=dinotrace
pkgver=9.4d
pkgrel=1
pkgdesc="A X-11 waveform viewer which understands Verilog Value Change Dumps, ASCII, and other trace formats"
arch=('i686' 'x86_64')
url="http://www.veripool.org/wiki/dinotrace/Intro"
license=('GPL')
depends=('openmotif')
source=(http://www.veripool.org/ftp/${pkgname}-${pkgver}.tgz)
md5sums=('6965bd6cdbf246a133933f917b628b13')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
