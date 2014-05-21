# $Id$
# Maintainer: Luke Foreman <luke@weeaboo.com>

pkgname=yuvmotionfps
pkgver=1.6
pkgrel=1
pkgdesc="mjpegtools addon program supplementing yuvfps with motion interpolation on progressive video"
arch=('i686' 'x86_64')
license=('GPL')
url="http://jcornet.free.fr/linux/yuvmotionfps.html"
depends=('mjpegtools')
makedepends=('v4l-utils')
options=('!makeflags')
source=(
	http://jcornet.free.fr/linux/download/mjpegtools/${pkgname}-${pkgver}.tgz
)
sha256sums=(
	'672E7E22CA91FBEAF7C22E462E168C1550E32EDB61E07B516DDD23BDA63E269D'
)

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's,linux/videodev.h,libv4l1-videodev.h,g' configure.ac
  autoconf configure.ac > configure 
  sed -i -e '/ARCHFLAGS=/s:=.*:=:' configure
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr 
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
