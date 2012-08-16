# Maintainer: Red Squirrel <iam at redsquirrel dot tk>

pkgname=videothumbnailsmaker
pkgver=5.0
pkgrel=4
pkgdesc="A simple Linux tool to take thumbnails from video files!"
arch=('any')
url="http://www.redsquirrel87.com/VideoThumbnailsMaker.html"
license=('freeware')
depends=('gambas3-gb-gtk' 'gambas3-gb-form' 'gambas3-gb-form-stock' 'gambas3-gb-image' 'gambas3-gb-image-effect' 'mplayer' 'imagemagick')
optdepends=('gambas3-gb-qt4: if you need the QT support (KDE)')
install='videothumbnailsmaker.install'
source=(http://dl.dropbox.com/u/5562654/${pkgname}-AUR-${pkgver}.tar.gz)
md5sums=('d03168348a4f627e14284a0a4f7a1055')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/videothumbnailsmaker.gambas" "${pkgdir}/usr/bin/videothumbnailsmaker"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/videothumbnailsmaker.desktop" "${pkgdir}/usr/share/applications/videothumbnailsmaker.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/videothumbnailsmaker128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/videothumbnailsmaker.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/videothumbnailsmaker64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/videothumbnailsmaker.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/videothumbnailsmaker32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/videothumbnailsmaker.png"
}

