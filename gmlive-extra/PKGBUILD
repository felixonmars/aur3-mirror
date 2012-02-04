#Maintainer: Previous Unknown
#Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=gmlive-extra
pkgver=0.3
pkgrel=2
pkgdesc="Addon for gmlive that provides sopcast and pplive."
arch=('i686')
url="http://code.google.com/p/gmlive/"
license=('GPL')
depends=('gmlive' 'gcc-libs' 'libxext')
makedepends=('pkgconfig' 'intltool')
source=(http://gmlive.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('e94313ff9170e7375b75b518a7aae5cf')

build() {
/bin/true
}
package() {
cd ${srcdir}/${pkgname}-${pkgver}
install -Dm755 xpplive ${pkgdir}/usr/bin/xpplive
install -Dm755 sp-sc-auth ${pkgdir}/usr/bin/sp-sc-auth
}
