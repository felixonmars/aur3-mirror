# Maintainer: Red Squirrel <iam at redsquirrel dot tk>

pkgname=megasquirrel
pkgver=4.1
pkgrel=1
pkgdesc="A MegaUpload.com Manager for Linux!"
arch=('i686' 'x86_64')
url="http://www.redsquirrel87.com/MegaSquirrel.html"
license=('freeware')
depends=('gambas2-runtime' 'gambas2-gb-gui' 'gambas2-gb-form' 'gambas2-gb-desktop' 'gambas2-gb-settings' 'gambas2-gb-web' 'gambas2-gb-xml' 'gambas2-gb-xml-xslt' 'curl')
makedepends=()
install='megasquirrel.install'
source=(http://dl.dropbox.com/u/5562654/${pkgname}-AUR-${pkgver}.tar.gz)
md5sums=('71a53305861bb33e0871d8a01e5d5875')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/megasquirrel.gambas" "${pkgdir}/usr/bin/megasquirrel"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/megasquirrel.desktop" "${pkgdir}/usr/share/applications/megasquirrel.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/megasquirrel64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/megasquirrel.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/megasquirrel48x48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/megasquirrel.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/megasquirrel32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/megasquirrel.png"
}

