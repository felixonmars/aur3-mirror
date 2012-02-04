# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=lcdemu
pkgver=0.6beta1
_pkgver=0.6-beta1
pkgrel=1
pkgdesc="a Mat*ix O*bital character display emulator"
arch=(i686)
url="http://www.esden.net/blog/lcdemu"
license=('GPL')
depends=('gtk2')
install=(lcdemu.install)
source=(http://www.esden.net/content/lcdemu/balls/${pkgname}-${_pkgver}.tar.bz2)
md5sums=('2de9c7407652ad9c8e13ec1a90f27c8c')

build() {
  cd ${startdir}/src/${pkgname}-${_pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
