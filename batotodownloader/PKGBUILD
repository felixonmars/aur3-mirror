# Maintainer: Red Squirrel <iam at redsquirrel87 dot com>

pkgname=batotodownloader
pkgver=1.0
pkgrel=1
pkgdesc="A very simple application that allows you to download any chapter from any manga available on bato.to website."
arch=('any')
url="http://www.redsquirrel87.com/Batoto.php"
license=('freeware')
depends=('java-runtime')
install='batotodownloader.install'
source=(https://bitbucket.org/Red_Squirrel/batoto-downloader/downloads/batotodownloader-AUR-${pkgver}.tar.gz)
md5sums=('47cbf0cef34392ec1596982f745de590')

package() {
  cd ${srcdir}/batotodownloader-${pkgver}
  cp -R opt $pkgdir
  install -Dm644 "batotodownloader.desktop" "${pkgdir}/usr/share/applications/batotodownloader.desktop"
  install -Dm644 "icon.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/batotodownloader.png"
}

