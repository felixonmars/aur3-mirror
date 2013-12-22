# Maintainer: Rolf Morel <$myfullname_without_spaces@gmail.com>
pkgname="libspacemouse-git"
pkgver=0.0.0
pkgrel=1
pkgdesc="A free software driver library for 3D/6DoF input devices"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/polyphemus/libspacemouse"
license=('GPL3')
depends=('udev')
makedepends=('git')
provides=("libspacemouse")
conflicts=("libspacemouse")
source=('git://github.com/polyphemus/libspacemouse.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/libspacemouse"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/libspacemouse"

  make
}

package() {
  cd "$srcdir/libspacemouse"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

