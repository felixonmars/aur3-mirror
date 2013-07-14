# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=pacdefence
pkgver=1.1.6
pkgrel=5
pkgdesc="Tower defence game"
arch=('any')
url="http://www.freewebs.com/pacdefence/"
license=('GPL3')
depends=('java-runtime' 'sh')

source=('http://www.freewebs.com/pacdefence/PacDefence.jar'
        'http://www.freewebs.com/pacdefence/PacDefence_manual.pdf'
        'pacdefence.desktop'
        'pacdefence.sh')

md5sums=('a6a12451688fc1ba4bebc75cc629ed9e'
         '98436ce93930b8a23f91767d61366b80'
         'd9598cf387c0e8ff0742a7132a62d9f3'
         'd7427855800c4830303c447b08b6566b')

package() {
  # main file
  install -Dm644 "${srcdir}/PacDefence.jar" "${pkgdir}/usr/share/${pkgname}/PacDefence.jar"

  # manual
  install -Dm644 "${srcdir}/PacDefence_manual.pdf" "${pkgdir}/usr/share/doc/${pkgname}/PacDefence_manual.pdf"

  # desktop entry
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # shell script
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
