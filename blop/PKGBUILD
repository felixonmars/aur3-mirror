# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=blop
pkgver=0.2.8
pkgrel=4
pkgdesc="Bandlimited LADSPA Oscillator Plugins"
arch=('i686' 'x86_64')
url="http://blop.sourceforge.net/index.html"
license=('GPL')
depends=('glibc')
makedepends=('ladspa')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('4baedbf1e7cacc7d1034c4bcd5556d6f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix="/usr"
  make DESTDIR="${pkgdir}"
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
