# Maintainer: Red Squirrel <iam at redsquirrel87 dot com>

pkgname=timmy
pkgver=3.1
pkgrel=1
pkgdesc="Timmy is your best assistant for online shopping: a simple cross-platform application that will allow you to follow the prices changes of products you wish, thanks to a confortable single list for all supported sites."
arch=('any')
url="http://www.redsquirrel87.com/Timmy.php"
license=('freeware')
depends=('java-runtime' 'xdg-utils')
install='timmy.install'
source=(https://bitbucket.org/Red_Squirrel/timmy/downloads/timmy-AUR-${pkgver}.tar.gz)
md5sums=('3c5bbd5ff63fe66f4e1730e882379809')

package() {
  cd ${srcdir}/timmy-${pkgver}
  cp -R opt $pkgdir
  install -Dm644 "timmy.desktop" "${pkgdir}/usr/share/applications/timmy.desktop"
  install -Dm644 "icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/timmy.png"
}

