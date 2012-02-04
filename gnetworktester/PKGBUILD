#Maintainer: Nathan O <ndowens.aur at gmail dot com>
pkgname=gnetworktester
pkgver=0.11.1
_realver=0.11.1-1
pkgrel=2
pkgdesc="Helps in testing the quality of a network connection and sending feedback to the ISP"
arch=('any')
url="http://sourceforge.net/projects/${pkgname}/"
license=('GPL')
depends=('python')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}_${_realver}.tar.gz)
md5sums=('09cc83b06404f5f5b9c1416682033b31')

build() {
  cd ${pkgname}-${pkgver}
  
  make 
  make PREFIX="${pkgdir}" install
}
