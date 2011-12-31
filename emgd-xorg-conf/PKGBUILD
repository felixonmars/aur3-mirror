# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=emgd-xorg-conf
pkgver=0.1~3~30
_date=201110271726
_ubuflag=oneiric1
pkgrel=4
pkgdesc="Configuration generator for Intel EMGD"
arch=('i686')
license=('custom')
url='https://code.launchpad.net/~gma500/+junk/emgd-xorg-conf-debian'
depends=('python2' 'dkms-emgd' 'xf86-video-emgd')
source=(https://launchpad.net/~gma500/+archive/emgd110/+files/${pkgname}_${pkgver}~${_date}~${_ubuflag}.tar.gz)
md5sums=('5042efb9238ab59f6c687ed0a2b1b185')

build() {
  cd ${srcdir}/recipe-${pkgver}~${_date}/src
  # python2 fix
  sed -i 's|python|python2|g' ${pkgname}.py
}

package() {
  cd ${srcdir}/recipe-${pkgver}~${_date}/src
  install -Dm775 ${pkgname}.py ${pkgdir}/usr/bin/${pkgname}
}
