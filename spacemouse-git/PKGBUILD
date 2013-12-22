# Maintainer: Rolf Morel <$myfullname_without_spaces@gmail.com>
pkgname="spacemouse-git"
pkgver=0.0.0
pkgrel=1
pkgdesc="A command-line utility for 3D/6DoF input devices"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/polyphemus/spacemouse"
license=('GPL3')
depends=('libspacemouse')
makedepends=('git')
provides=("spacemouse")
conflicts=("spacemouse")
source=('git://github.com/polyphemus/spacemouse.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/spacemouse"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/spacemouse"

  make
}

package() {
  cd "$srcdir/spacemouse"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

