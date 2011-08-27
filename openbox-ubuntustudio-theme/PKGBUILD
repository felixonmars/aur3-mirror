# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=openbox-ubuntustudio-theme
pkgver=20091104
pkgrel=1
pkgdesc="Ubuntu studio OpenBox Theme"
arch=('any')
url="http://opendesktop.org/content/show.php/ubuntustudio?content=59671"
license=('GPL')
depends=('openbox')
source=(http://opendesktop.org/CONTENT/content-files/59671-ubuntustudio.obt)
md5sums=('e090276ebc976f918c075e134e95a2a8')

build() {
  install -d ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/ubuntustudio ${pkgdir}/usr/share/themes/ || return 1
}
