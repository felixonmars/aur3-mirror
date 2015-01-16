# Maintainer: Doug Richardson <dougie.richardson@gmail.com>
pkgname=v4l-mjpg-stream
pkgver=1.0.0
pkgrel=1
pkgdesc="HTTP stream motion JPEG from a Video4Linux capable camera"
arch=(any)
url="https://github.com/drichardson/arch_packages"
license=('BSD')
depends=(mjpg-streamer)
optdepends=()
backup=()
changelog=
install=v4l-mjpg-stream.install
source=(v4l-mjpg-stream.service)
sha256sums=('560378103f6429c1e5ad99c55415bbccfd3c73a6b73c963f5eaa2eff85d76858')

package() {
  cd "$srcdir"
  install -Dm644 v4l-mjpg-stream.service "$pkgdir"/usr/lib/systemd/system/v4l-mjpg-stream.service
}
