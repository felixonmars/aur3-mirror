# Maintainer: juankfree <juan77.sonic at gmail dot com>
pkgname=pushimg
pkgver=1
pkgrel=1
pkgdesc="A super-quick way to share screenshots"
arch=('any')
url="https://github.com/juankfree/pushimg"
license=('GPL2')
depends=('imagemagick' 'libnotify' 'xclip' 'python-pip')
options=('!strip')
install="pushimg.install"
source=('pushimg' 'libpushimg')
md5sums=('5de6d79c5e54ddd63fa1660d7bddd140' '2e8d9fc44264b8dc9305c6dc060c5a4c')
package() {
  install -Dm755 "${srcdir}/pushimg" "${pkgdir}/usr/bin/pushimg"
  install -Dm755 "${srcdir}/libpushimg" "${pkgdir}/usr/bin/libpushimg"
}
