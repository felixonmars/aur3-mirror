# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Renan Birck <renan.ee.ufsm at gmail.com>
 
pkgname=logisim-evolution
_truepkgname=logisim
pkgver=2.13.5
pkgrel=3
provides=('logisim')
conflicts=('logisim')
pkgdesc='An educational tool for designing and simulating digital logic circuits'
arch=('any')
url="http://sourceforge.net/projects/logisimevolution/"
license=('GPL2')
depends=('java-runtime' 'gtk-update-icon-cache' 'desktop-file-utils' 'shared-mime-info')
install=logisim.install
source=(https://reds.heig-vd.ch/share/logisim-evolution/logisim-evolution-2.13.5.jar
        ${_truepkgname}.xml
        ${_truepkgname}.desktop
        ${_truepkgname}.sh)
sha256sums=('d02ba7051e79f9b603431faa358fcc40815abba01dcb3651820e2f55560c6e91'
            '9dd50eb99edeff5f74247ae9b050d56c1366818ea80fbdcc6c5e24bfabfec5c0'
            '4d5ae9f9d5f5789469f3580a81ee568ca426f324df3ba37d7e4c8d6b20dc638c'
            '56eaac407f6ae64289ab228269edb8b1a2bbe647e2baf5dfab7f481c9db8e680')

package() {
  cd "$srcdir"

  install -Dm644 ${pkgname}-${pkgver}.jar "${pkgdir}/usr/share/java/${_truepkgname}/${_truepkgname}.jar"
  install -Dm644 ${_truepkgname}.xml "${pkgdir}/usr/share/mime/packages/${_truepkgname}.xml"
  install -Dm644 ${_truepkgname}.desktop "${pkgdir}/usr/share/applications/${_truepkgname}.desktop"
  for SIZE in 16 20 24 48 64 128; do
    install -Dm644 resources/${_truepkgname}/img/${_truepkgname}-icon-${SIZE}.png \
      "${pkgdir}/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/${_truepkgname}.png"
  done
  install -Dm755 ${_truepkgname}.sh "${pkgdir}/usr/bin/${_truepkgname}"
}
