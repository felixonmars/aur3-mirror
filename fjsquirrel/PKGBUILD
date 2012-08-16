# Maintainer: Red Squirrel <iam at redsquirrel dot tk>

pkgname=fjsquirrel
pkgver=1.0
pkgrel=4
pkgdesc="A Filejungle.com Uploader for Linux"
arch=('any')
url="http://www.redsquirrel87.com/FJSquirrel.html"
license=('freeware')
depends=('gambas2-gb-form' 'gambas2-gb-gtk' 'gambas2-gb-settings' 'curl')
optdepends=('gambas2-gb-qt: if you need the QT support (KDE)')
install='fjsquirrel.install'
source=(http://dl.dropbox.com/u/5562654/${pkgname}-AUR-${pkgver}.tar.gz)
md5sums=('d62120bcf684bbe2e9f7e40b53b045c1')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/fjsquirrel.gambas" "${pkgdir}/usr/bin/fjsquirrel.gambas"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/fjsquirrel.desktop" "${pkgdir}/usr/share/applications/fjsquirrel.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/fjsquirrel64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/fjsquirrel.png"
}

