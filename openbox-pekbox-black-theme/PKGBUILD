# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=openbox-pekbox-black-theme
pkgver=20100225
pkgrel=1
pkgdesc="pekbox black OpenBox Theme"
arch=('any')
url="http://opendesktop.org/content/show.php/PekBox?content=120725"
license=('GPL')
depends=('openbox')
source=(http://art.ified.ca/downloads/PekBoxBlack.obt)
md5sums=('8ecf2ab1fbd2905b32dfcd8ce662a59e')

build() {
  install -d ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/PekBoxBlack ${pkgdir}/usr/share/themes/ || return 1
}
