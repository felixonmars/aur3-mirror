# Maintainer: Red Squirrel <iam at redsquirrel dot tk>

pkgname=wiicoversdownloader
pkgver=0.3
pkgrel=3
pkgdesc="A Linux tool to download Wii games' covers directly from the famous WiiTDB."
arch=('any')
url="http://www.redsquirrel87.com/WiiCoversDownloader.html"
license=('freeware')
depends=('gambas3-gb-form' 'gambas3-gb-gtk' 'gambas3-gb-image' 'gambas3-gb-settings' 'gambas3-gb-web' 'gambas3-gb-net' 'gambas3-gb-net-curl')
optdepends=('gambas3-gb-qt4: if you need the QT support (KDE)')
install='wiicoversdownloader.install'
source=(http://dl.dropbox.com/u/5562654/${pkgname}-AUR-${pkgver}.tar.gz)
md5sums=('d019e9d05329d848641e5ea15affe826')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/wiicoversdownloader.gambas" "${pkgdir}/usr/bin/wiicoversdownloader"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/wiicoversdownloader.desktop" "${pkgdir}/usr/share/applications/wiicoversdownloader.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/wiicoversdownloader128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/wiicoversdownloader.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/wiicoversdownloader64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/wiicoversdownloader.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/wiicoversdownloader32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/wiicoversdownloader.png"
}

