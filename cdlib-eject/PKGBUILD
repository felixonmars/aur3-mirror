# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=cdlib-eject
pkgver=0.2
pkgrel=1
pkgdesc='A lightweight utility to control Dacal CD Library II devices.'
arch=('i686' 'x86_64')
url='http://cryptocrack.de/projects/#cdlib-eject'
license=('BSD')
depends=('libusb-compat')
source=("http://cryptocrack.de/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('bc507a55f385ad12c182864bfd30ee26')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
