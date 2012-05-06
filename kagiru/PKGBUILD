# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=kagiru
pkgver=0.25
pkgrel=3
pkgdesc="A simple Java-based Sudoku game"
arch=('any')
url="http://kagiru.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
install="${pkgname}.install"
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-self-executable.jar"
        "${pkgname}.desktop"
        "${pkgname}.sh")
noextract=("${pkgname}-${pkgver}-self-executable.jar")
md5sums=('7108728a870488036282b5927fc2ec39'
         '657fa553d3472f0e2d7f65b11597e6ea'
         '027ea2b2fd60cdd37f327012328e8b84')

package() {
  cd "${srcdir}"

  # Install game files
  install -Dm644 "${pkgname}-${pkgver}-self-executable.jar" \
    "${pkgdir}/opt/${pkgname}/${pkgname}.jar"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install a config file
  touch "${pkgname}.cfg"
  install -m664 -g games "${pkgname}.cfg" "${pkgdir}/opt/${pkgname}/${pkgname}.cfg"

  # Install a desktop entry
  bsdtar -xOf "${pkgname}-${pkgver}-self-executable.jar" \
    icons/other/kagiru-green.png > "${pkgname}.png"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
