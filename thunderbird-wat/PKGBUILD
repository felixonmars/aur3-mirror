# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>
_checkout=20120901gitd99f7e1
_ver=1.5
pkgname=thunderbird-wat
pkgver=1.5pre
pkgrel=3
pkgdesc="Thunderbird addon for opening web contents in new tab"
arch=('any')
url="https://github.com/teramako/wat/"
license=('GPL2' 'MPL' 'LGPL2.1')
makedepends=('zip') #for build.sh
depends=('thunderbird')
install='tb-wat.install'
source=(https://github.com/teramako/wat/archive/master.zip)
source=(https://dl.dropboxusercontent.com/u/7141888/${pkgname}-${_ver}-${_checkout}.tar.gz)
md5sums=('f83b642b5d9c83cdd959016275ffedb1')
build() {
  cd ${pkgname}-${_ver}-${_checkout}
  sh build.sh
}
package() {
  cd ${pkgname}-${_ver}-${_checkout}
  install -Dm644 wat-${pkgver}.xpi ${pkgdir}/usr/lib/thunderbird/extensions/wat@teramako.xpi
}
