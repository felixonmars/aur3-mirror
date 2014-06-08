# Contributor: Ludovic LE ROUX <luudoroux@gmail.com>

pkgname=visiocom
pkgver=1.1
pkgrel=1
pkgdesc="Drag'n'drop tool"
arch=('any')
url="http://visiocom.sourceforge.net/"
depends=('java-runtime>=6')
license=("GPL")
install="${pkgname}.install"
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('0503cddd164e26d3c82db217816edd5e'
         '89dd4b54775d66a3af279d8116b19b62'
         'e9c1b61fbd89f6b83a0e5f33c4a71f88'
         'df888ea076a4c94f6e657d537ae117ad')


package() {

  # Create directories
  install -m755 -d ${pkgdir}/usr/bin
  install -m755 -d ${pkgdir}/usr/share/${pkgname}
  install -m755 -d ${pkgdir}/usr/share/icons/hicolor/128x128/apps
  install -m755 -d ${pkgdir}/usr/share/applications

  # Install files
  install -m644  ${srcdir}/${pkgname}-${pkgver}/*.jar ${pkgdir}/usr/share/${pkgname} 
  install -m755  ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  install -m644  ${srcdir}/${pkgname}.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps
  install -m644  ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications

}
