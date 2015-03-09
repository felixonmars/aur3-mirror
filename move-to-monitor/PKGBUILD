# Maintainer: Sebastian Loncar <sebastian.loncar@gmail.com>

pkgname=move-to-monitor
pkgver=1.0.4
pkgrel=1
pkgdesc="Move the current window to the next monitor."
url="https://github.com/Arakis/move-to-monitor"
license=("BSD")
depends=("wmctrl" "xdotool")
makedepends=("git")
provides=("move-to-monitor")
conflicts=("move-to-monitor")
source=("git://github.com/Arakis/move-to-monitor.git")
arch=(any)
md5sums=("SKIP")

#pkgver() {
#  cd exec-or-activate-application
#  git rev-list HEAD --count
#}

package() {
  cd move-to-monitor
  make DESTDIR="$pkgdir" install
}
