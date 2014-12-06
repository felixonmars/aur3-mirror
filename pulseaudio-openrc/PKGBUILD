# Maintainer: Zatherz <zatherz[at]linux[dot]com>
pkgname=pulseaudio-openrc
pkgver=1.0
pkgrel=2
pkgdesc="Pulseaudio service for OpenRC"
arch=('x86_64' 'i686')
url="http://zatherz.github.io/"
license=('GPLv2')
depends=('openrc-core' 'pulseaudio' 'consolekit-openrc' 'alsa-utils-openrc')
source=("pulseaudio")
md5sums=('f3256e33f3623f8590ea16e44a2eac87')

package() {
  install -Dm755 pulseaudio "$pkgdir/etc/init.d/pulseaudio"
}
