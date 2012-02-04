# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=xmms-reloaded
pkgver=0.1.2
pkgrel=1
pkgdesc="XMMS-Reloaded reloads your XMMS playlist"
arch=(i686)
url="http://www.tuximus.org/xmms-reloaded/"
license=('GPL')
depends=('xmms')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('9fa9ade704e31fdc4cefeb8dc9c3ff82')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure
  make || return 1
  install -D -m755 libreloaded.so ${startdir}/pkg/usr/lib/xmms/General/libreloaded.so
}
