# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=openbox-pekbox-theme
pkgver=20100225
pkgrel=1
pkgdesc="Pekbox OpenBox Theme"
arch=('any')
url="http://opendesktop.org/content/show.php/PekBox?content=120725"
license=('GPL')
depends=('openbox')
source=(http://art.ified.ca/downloads/PekBox.obt)
md5sums=('fee635b69022f69cd66cf79d2c5fc8f0')

build() {
  install -d ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/PekBox ${pkgdir}/usr/share/themes/ || return 1
}
