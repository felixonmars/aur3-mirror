# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=emgd-sys-tools
pkgver=0.1~2~11
_date=201110111236
_ubuflag=oneiric1
pkgrel=4
pkgdesc="Systemtools for Intel EMGD"
arch=('i686')
license=('custom')
url='https://code.launchpad.net/~gma500/+junk/emgd-sys-tools'
depends=('python2' 'dkms-emgd' 'xf86-video-emgd')
source=(https://launchpad.net/~gma500/+archive/emgd110/+files/${pkgname}_${pkgver}~${_date}~${_ubuflag}.tar.gz)
md5sums=('73420e9a461bb448a6e323a6a8365904')

build() {
  cd ${srcdir}/recipe-${pkgver}~${_date}/src
  # python2 fix
  sed -i 's|python|python2|g' *.py
}

package() {
  cd ${srcdir}/recipe-${pkgver}~${_date}/src
  install -Dm775 emgd-sys-blkman.py ${pkgdir}/usr/bin/emgd-sys-blkman
  install -Dm775 emgd-sys-fixpm.py ${pkgdir}/usr/bin/emgd-sys-fixpm
  install -Dm775 emgd-sys-grubman.py ${pkgdir}/usr/bin/emgd-sys-grubman
  install -Dm775 emgd-sys-modman.py ${pkgdir}/usr/bin/emgd-sys-modman
  install -Dm775 emgd-sys-resman.py ${pkgdir}/usr/bin/emgd-sys-resman
}
