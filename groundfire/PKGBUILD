# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Nicoco

pkgname=groundfire
pkgver=0.25
pkgrel=2
pkgdesc="A 2D multiplayer tank game inspired by Death Tank for the Sega Saturn"
arch=('i686' 'x86_64')
url="http://www.groundfire.net/"
license=('MIT')
depends=('freealut' 'glfw' 'libxxf86vm' 'mesa')
install="${pkgname}.install"
source=("http://www.groundfire.net/download/${pkgname}-src-${pkgver}.tar.gz"
        "${pkgname}.patch"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('52a32e3037798b81ef4430ab63ccb8ee'
         'dd8e1938470ef022d2360f6db6ed0c27'
         'bec76fd1dcbbfe451e6e67250d69db50'
         'b519d2a803dd20dd14a4c34d507011b2'
         '34dfb194e7a1da211f464f675107e997')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "../${pkgname}.patch"
  make unix
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install launcher
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install game files
  mkdir -p "${pkgdir}/opt/${pkgname}/"{conf,data}
  install -m664 -g games conf/* "${pkgdir}/opt/${pkgname}/conf"
  install -m644 data/* "${pkgdir}/opt/${pkgname}/data"
  install -m755 "${pkgname}" "${pkgdir}/opt/${pkgname}"

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation and license
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 *.txt "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
