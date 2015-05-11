# Maintainer: Maxime Morel <maxime@mmorel.eu>

pkgname=dali-demo-git
pkgver=1.0.40
pkgrel=1
pkgdesc="OpenGl based 3D GUI toolkit - demo"
arch=('x86_64' 'i686')
url="git://git.tizen.org/platform/core/uifw/dali-demo"
license=('APACHE')
depends=('dali-toolkit-git')
makedepends=('git' 'cmake')
provides=('dali-demo')
conflicts=('dali-demo')
source=("git://git.tizen.org/platform/core/uifw/dali-demo")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/dali-demo"
  printf "%s" "$(git describe | sed -r 's/^dali_(.*)-[0-9]+-[a-z0-9]+$/\1/')"
}

prepare() {
  cd "$srcdir/dali-demo"
}

build() {
  cd "$srcdir/dali-demo/build/tizen"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/dali-demo/build/tizen"
  make DESTDIR="$pkgdir/" install
}

