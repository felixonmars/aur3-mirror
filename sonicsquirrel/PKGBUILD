# Maintainer: Red Squirrel <iam at redsquirrel dot tk>

pkgname=sonicsquirrel
pkgver=2.1
pkgrel=1
pkgdesc="A Filesonic.com Manager for Linux!"
arch=('i686' 'x86_64')
url="http://www.redsquirrel87.com/SonicSquirrel.html"
license=('freeware')
depends=('gambas2-runtime' 'gambas2-gb-form' 'gambas2-gb-gui' 'gambas2-gb-settings' 'curl')
makedepends=()
install='sonicsquirrel.install'
source=(http://dl.dropbox.com/u/5562654/${pkgname}-AUR-${pkgver}.tar.gz)
md5sums=('c3f1dc354a1a0b5f99d10fdda1168637')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/sonicsquirrel.gambas" "${pkgdir}/usr/bin/sonicsquirrel"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/sonicsquirrel.desktop" "${pkgdir}/usr/share/applications/sonicsquirrel.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/sonicsquirrel48x48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/sonicsquirrel.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/sonicsquirrel32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/sonicsquirrel.png"
}

