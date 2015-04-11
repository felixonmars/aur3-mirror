# Maintainer: Red Squirrel <iam at redsquirrel87 dot com>

pkgname=mangaedenbatchdownloader
pkgver=6.1
pkgrel=1
pkgdesc="A simple tool to download in batch manga chapters from MangaEden.com"
arch=('any')
url="http://www.redsquirrel87.com/MangaEden.html"
license=('freeware')
depends=('java-runtime')
install='edenbatchdownloader.install'
source=(https://bitbucket.org/Red_Squirrel/eden-batch-downloader/downloads/edenbatchdownloader-AUR-${pkgver}.tar.gz)
md5sums=('0884f7f92d98b17976bf948ca0a61a3a')

package() {
  cd ${srcdir}/edenbatchdownloader-${pkgver}
  cp -R opt $pkgdir
  install -Dm644 "edenbatchdownloader.desktop" "${pkgdir}/usr/share/applications/edenbatchdownloader.desktop"
  install -Dm644 "icon.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/edenbatchdownloader.png"
}

