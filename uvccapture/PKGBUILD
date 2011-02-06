pkgname=uvccapture
pkgver=0.5
pkgrel=4
pkgdesc="Command-line tool to capture webcam images with v4l2"
depends=('libjpeg')
arch=(i686)
url="http://linux-uvc.berlios.de"
license=('GPL')
source=(http://staticwave.ca/source/uvccapture/uvccapture-0.5.tar.bz2)
md5sums=('2ac901069a35b8954c11b11f6e036989')

build() {
cd ${srcdir}/${pkgname}-${pkgver}
make || return 1
install -D -m755 ./uvccapture ${pkgdir}/usr/bin/uvccapture || return 1
}
