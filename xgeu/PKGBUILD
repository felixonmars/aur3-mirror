# Maintainer: Red Squirrel <iam at redsquirrel87 dot com>

pkgname=xgeu
pkgver=7.0
pkgrel=1
pkgdesc="A simple Linux tool to search for and download updates for your XBOX360 games directly from your PC (no need of XBOX Live!)"
arch=('any')
url="http://www.redsquirrel87.com/XGEU.html"
license=('freeware')
depends=('java-runtime')
install='XGEU.install'
source=(https://bitbucket.org/Red_Squirrel/xbox360-games-easy-updater/downloads/${pkgname}-AUR-${pkgver}.tar.gz)
md5sums=('fa9d2e15b5423e90f2fcf16248643f48')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cp -R opt $pkgdir
  install -Dm644 "XGEU.desktop" "${pkgdir}/usr/share/applications/XGEU.desktop"
  install -Dm644 "icon-64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/XGEU.png"
  install -Dm644 "icon-32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/XGEU.png"
}

