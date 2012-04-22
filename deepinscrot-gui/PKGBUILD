# Maintainer: Red Squirrel <iam at redsquirrel dot tk>

pkgname=deepinscrot-gui
pkgver=1.0.2
pkgrel=1
pkgdesc="A minimal GUI for Deepin Scrot."
arch=('i686' 'x86_64')
url="http://www.redsquirrel87.com/DeepinScrotGUI.html"
license=('freeware')
depends=('gambas2-runtime' 'gambas2-gb-gui' 'gambas2-gb-form' 'gambas2-gb-settings' 'deepin-scrot')
install='deepinscrot-gui.install'
source=(http://dl.dropbox.com/u/5562654/${pkgname}-AUR-${pkgver}.tar.gz)
md5sums=('36699018896a5dc8d09cc05c73dd69a8')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/deepinscrot-gui.gambas" "${pkgdir}/usr/bin/deepinscrot-gui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/deepinscrot-gui.desktop" "${pkgdir}/usr/share/applications/deepinscrot-gui.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/icon-64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/deepinscrot-gui.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/icon-48x48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/deepinscrot-gui.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/icon-32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/deepinscrot-gui.png"
}

