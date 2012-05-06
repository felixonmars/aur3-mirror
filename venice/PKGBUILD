# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=venice
pkgver=0.75beta
pkgrel=1
pkgdesc="A stock market trading program with many features"
arch=('any')
url="http://mov.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
source=("http://downloads.sourceforge.net/mov/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('f6aa08e79ac65c4768d1910d58518b2a'
         '659435347821e2044d6f4c12690f2910'
         'f75c8e5c0d426ca3a164f914df386584')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install program files
  sed -i "s_venice.jar_/usr/share/venice/&_" "${pkgname}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.jar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"

  # Install a desktop entry
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 doc/* *.txt "${pkgdir}/usr/share/doc/${pkgname}"
}
