# Maintainer: Red Squirrel <iam at redsquirrel87 dot com>

pkgname=deepinscreenshot-gui
pkgver=1.1.0
pkgrel=1
pkgdesc="A minimal GUI for Deepin Screenshot."
arch=('any')
url="http://www.redsquirrel87.com/DeepinScreenshotGUI.html"
license=('freeware')
depends=('gambas2-gb-gtk' 'gambas2-gb-form' 'gambas2-gb-settings' 'deepin-screenshot-git')
optdepends=('gambas2-gb-qt: if you need the QT support (KDE)')
install='deepinscreenshot-gui.install'
source=(http://dl.dropbox.com/u/5562654/${pkgname}-AUR-${pkgver}.tar.gz)
md5sums=('863a8a50f4b4fe3f60916e6392fb30a8')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/deepinscreenshot-gui.gambas" "${pkgdir}/usr/bin/deepinscreenshot-gui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/deepinscreenshot-gui.desktop" "${pkgdir}/usr/share/applications/deepinscreenshot-gui.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/icon-64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/deepinscreenshot-gui.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/icon-48x48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/deepinscreenshot-gui.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/icon-32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/deepinscreenshot-gui.png"
}

