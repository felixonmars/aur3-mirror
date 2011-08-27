# Maintainer: abutment <iain@sphinx.mythic-beasts.com>
pkgname=ir.lv2
pkgver=1.3.1
pkgrel=1
pkgdesc="Low latency reverb convolver"
url="http://factorial.hu/plugins/lv2/ir"
license=('GPL')
depends=('zita-convolver' 'libsndfile' 'libsamplerate' 'gtk2')
arch=('i686' 'x86_64')
source=(http://factorial.hu/system/files/$pkgname-$pkgver.tar.gz)
md5sums=('2c7767db934a1ca4d55d220e7ebad912')

build () {
  cd ${srcdir}/${pkgname}-${pkgver}/
  make || return 1
  make PREFIX=${pkgdir}/usr install || return 1
}

