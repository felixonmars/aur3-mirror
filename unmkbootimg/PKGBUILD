# Maintainer : Gergely Imreh <imrehgATgmailDOTcom>
pkgname=unmkbootimg
pkgver=1.2
pkgrel=1
pkgdesc="reverse mkbootimg utility"
arch=('i686' 'x86_64')
url="http://whiteboard.ping.se/Android/Unmkbootimg"
license=('Apache')
makedepends=()
depends=()
source=("http://whiteboard.ping.se/uploads/Android/unmkbootimg.gz")

package() {
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/"
}

sha256sums=('5f5d0c3f339d026132da77fc149b7f21b3e263d6e5d6339665a32002340db141')
