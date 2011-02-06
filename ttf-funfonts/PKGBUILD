# Contributor: Darío Andrés Rodríguez <darzephyr@gmail.com>
# Mantainer: Ronny Steiner <post@sirsteiner.de>
# AUR Category: x11

pkgname=ttf-funfonts
pkgver=2
pkgrel=1
pkgdesc="76 selected TTF fonts from 6760 fonts package"
arch=(any)
url="http://thelinuxbox.org/"
license=('custom')
install=${pkgname}.install
source=(http://thelinuxbox.org/downloads/fonts/funfonts.tar.gz
        LICENSE)
md5sums=('3dd9c79d77e58cdb532cc6c21e7914d5'
         'd30e0838c9a9f2a6148bda33b28ad6a6')

build() {
  cd ${srcdir}/funfonts/

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 * ${pkgdir}/usr/share/fonts/TTF

  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
