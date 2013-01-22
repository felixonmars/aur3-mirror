# Maintainer: Red Squirrel <iam at redsquirrel87 dot com>

pkgname=furx
pkgver=1.0
pkgrel=1
pkgdesc="A simple desktop client for Furk.net"
arch=('any')
url="http://www.redsquirrel87.com/Furx.html"
license=('freeware')
depends=('gambas3-gb-image' 'gambas3-gb-settings' 'gambas3-gb-desktop'  'gambas3-gb-gtk' 'gambas3-gb-form' 'gambas3-gb-net' 'gambas3-gb-net-curl' 'gambas3-gb-web')
optdepends=('gambas3-gb-qt4: if you need the QT support (KDE)')
install='furx.install'
source=(https://bitbucket.org/Red_Squirrel/furx/downloads/${pkgname}-AUR-${pkgver}.tar.gz)
md5sums=('9a6f0a924ac6da56b1539fe8f864f2bc')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/furx.gambas" "${pkgdir}/usr/bin/furx"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/furx.desktop" "${pkgdir}/usr/share/applications/furx.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/icon.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/furx.png"
}

