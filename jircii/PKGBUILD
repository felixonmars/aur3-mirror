# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Francesco Piccinno <stack.box@gmail.com>

pkgname=jircii
pkgver=0.9
pkgrel=1
pkgdesc="Cross-platform IRC client written in Java"
arch=('any')
url="http://www.oldschoolirc.com/"
license=('PerlArtistic')
depends=('jre7-openjdk')
source=("http://www.oldschoolirc.com/download/jerk072011.tgz"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('5d60f619ecc2248498ec388e0b21ec95'
         'bee2e320a9be87fff4d5fcd87d3b09e1'
         'b902f23e5886eee39c81bca3414c0f52'
         '4a10b0315f5f0c3b080eab117f8f63c3')

package() {
  cd "${srcdir}/jIRCii"

  # Install the program and launcher
  install -Dm644 jerk.jar "${pkgdir}/usr/share/java/${pkgname}/jerk.jar"
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install the pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install docs
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 docs/* *.txt "${pkgdir}/usr/share/doc/${pkgname}"
}
