# Maintainer: Red Squirrel <iam at redsquirrel87 dot com>

pkgname=mkvextract-ggui
pkgver=2.0
pkgrel=2
pkgdesc="A simple GUI written in Gambas for mkvextract tool."
arch=('any')
url="http://www.redsquirrel87.com/MKVExtractGGUI.html"
license=('freeware')
depends=('gambas3-gb-gtk' 'gambas3-gb-form' 'gambas3-gb-settings' 'gambas3-gb-desktop' 'gambas3-gb-image' 'mkvtoolnix')
optdepends=('gambas3-gb-qt4: if you need the QT support (KDE)')
install='mkvextract-ggui.install'
source=(https://bitbucket.org/Red_Squirrel/mkvextract-gambas-gui/downloads/${pkgname}-AUR-${pkgver}.tar.gz)
md5sums=('0e35f6c0109b4581659396f65475296f')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/mkvextract-ggui.gambas" "${pkgdir}/usr/bin/mkvextract-ggui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/mkvextract-ggui.desktop" "${pkgdir}/usr/share/applications/mkvextract-ggui.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/mkvextract-ggui.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/mkvextract-ggui.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/mkvextract-ggui.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/48x48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/mkvextract-ggui.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/mkvextract-ggui.png"
}

