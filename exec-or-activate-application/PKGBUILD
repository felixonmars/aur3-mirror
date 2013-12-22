# Maintainer: Sebastian Loncar <sebastian.loncar@gmail.com>

pkgname=exec-or-activate-application
pkgver=1.0.2
pkgrel=1
pkgdesc="Checks, if a specific application is running. If so, the window will focused. If not, the application will be launched."
url="https://github.com/Arakis/exec-or-activate-application"
license=("BSD")
depends=("wmctrl")
makedepends=("git")
provides=("exec-or-activate-application")
conflicts=("exec-or-activate-application")
source=("git://github.com/Arakis/exec-or-activate-application.git")
arch=(any)
md5sums=("SKIP")

#pkgver() {
#  cd exec-or-activate-application
#  git rev-list HEAD --count
#}

package() {
  cd exec-or-activate-application
  make DESTDIR="$pkgdir" install
}
