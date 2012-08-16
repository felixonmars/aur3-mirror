# Maintainer: Red Squirrel <iam at redsquirrel dot tk>

pkgname=manny
pkgver=1.9.3
pkgrel=3
pkgdesc="A Google Music client, manager, player and downloader!"
arch=('any')
url="http://www.redsquirrel87.com/manny.html"
license=('freeware')
depends=('gambas3-gb-form-stock' 'gambas3-gb-desktop' 'gambas3-gb-form' 'gambas3-gb-gtk' 'gambas3-gb-image' 'gambas3-gb-settings' 'gambas3-gb-web' 'curl' 'mplayer' 'terminal')
makedepends=()
optdepends=('gambas3-gb-qt4: if you need the QT support (KDE)' 'vlc: it can be used to play tracks in streaming' 'wget: you need it if you want to download your tracks')
install='manny.install'
source=(http://dl.dropbox.com/u/5562654/${pkgname}-AUR-${pkgver}.tar.gz)
md5sums=('c0341c1107a3c3b8060cd83750889144')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/manny.gambas" "${pkgdir}/usr/bin/manny"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/manny.desktop" "${pkgdir}/usr/share/applications/manny.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/manny256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/manny.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/manny128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/manny.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/manny64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/manny.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/manny32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/manny.png"
}

