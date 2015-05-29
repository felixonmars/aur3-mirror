# Contributor: Flow

pkgname=openbox-2ndlooks-theme
pkgver=20100114
pkgrel=2
pkgdesc="2ndlooks OpenBox Theme"
arch=('any')
url="http://opendesktop.org/content/show.php/2ndlooks?content=117054"
license=('GPL')
depends=('openbox')
source=(http://opendesktop.org/CONTENT/content-files/117054-2ndlooks.tar.bz2)
md5sums=('5644fe281b95a6422d43d4c809c99f96')

package() {
  install -d ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/2ndlooks ${pkgdir}/usr/share/themes/
}
