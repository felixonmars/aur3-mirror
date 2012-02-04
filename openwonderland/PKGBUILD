# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=openwonderland
pkgver=0.5_User_Preview_4
pkgrel=1
pkgdesc='Open Wonderland is a 100% Java open source toolkit for creating collaborative 3D virtual worlds.'
arch=('any')
license=('GPL')
url='http://openwonderland.org/'
depends=('java-runtime')
source=("http://download.openwonderland.org/releases/preview4/Wonderland.jar"
        'openwonderland')
md5sums=('2ed4042a75e37330836f8955f17c2524'
         '027013c43ccc083908ecee4aae600647')

package() {
  install -d ${pkgdir}/usr/share/java/wonderland
  install -m644 Wonderland.jar \
    ${pkgdir}/usr/share/java/wonderland

  install -d ${pkgdir}/usr/bin
  install openwonderland \
    ${pkgdir}/usr/bin
}
