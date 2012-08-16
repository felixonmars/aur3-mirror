# Maintainer: Red Squirrel <iam at redsquirrel dot tk>

pkgname=fsquirrel
pkgver=2.1
pkgrel=2
pkgdesc="A FileServe.com Manager for Linux!"
arch=('any')
url="http://www.redsquirrel87.com/FSquirrel.html"
license=('freeware')
depends=('gambas2-gb-gtk' 'gambas2-gb-form' 'gambas2-gb-desktop' 'gambas2-gb-settings' 'curl')
optdepends=('gambas2-gb-qt: if you need the QT support (KDE)')
install='fsquirrel.install'
source=(http://dl.dropbox.com/u/5562654/${pkgname}-AUR-${pkgver}.tar.gz)
md5sums=('ec69081b62e180f7a3d7fd2f1729cf02')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/fsquirrel.gambas" "${pkgdir}/usr/bin/fsquirrel"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/fsquirrel.desktop" "${pkgdir}/usr/share/applications/fsquirrel.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/fsquirrel32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/fsquirrel.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/fsquirrel64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/fsquirrel.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/fsquirrel128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/fsquirrel.png"
}

