# Maintainer: Zatherz <zatherz[at]linux[dot]com>
pkgname=xmixer
pkgver=1.0
pkgrel=1
pkgdesc="Bash xterm with alsamixer launcher"
url="http://zatherz.github.io/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('xterm' 'bash' 'alsa-utils')
makedepends=()
source=("xmixer")
md5sums=("86d5963241e1189a5c3c6f16fd4fe056")

package() {
  install -Dm755 xmixer "$pkgdir/usr/bin/xmixer"
}
