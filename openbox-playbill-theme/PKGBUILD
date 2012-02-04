# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=openbox-playbill-theme
pkgver=2010111907
pkgrel=1
pkgdesc="Openbox theme based on the playbill blue and red gtk theme"
arch=('any')
url="http://opendesktop.org/content/show.php/playbill+blue+and+red?content=108360"
license=('GPL')
depends=('openbox')
optdepends=('gtk-playbill-theme')
source=(http://opendesktop.org/CONTENT/content-files/108360-playbill.zip)
md5sums=('e69ca7fedc519f993b881c2643dcb84a')

build() {
  install -d ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/playbillblue ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/playbillred ${pkgdir}/usr/share/themes/
}
