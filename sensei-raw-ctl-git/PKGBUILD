# Maintainer: Přemysl Janouch <p.janouch@gmail.com>

pkgname=sensei-raw-ctl-git
_pkgname=sensei-raw-ctl
pkgver=r20.16dce19
pkgrel=1
pkgdesc="SteelSeries Sensei Raw configuration tool"
url="https://github.com/pjanouch/sensei-raw-ctl"
arch=('i686' 'x86_64')
license=('BSD')
options=(zipman)
conflicts=('sensei-raw-ctl')
provides=('sensei-raw-ctl')
makedepends=('cmake' 'pkg-config' 'git' 'help2man')
depends=('libusb')
optdepends=('gtk3: the GUI frontend'
            'polkit: the GUI frontend')
install=sensei-raw-ctl.install
source=('git+https://github.com/pjanouch/sensei-raw-ctl')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $srcdir/$_pkgname
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_GUI=ON
  make
}

package() {
  cd $srcdir/$_pkgname/build
  make install DESTDIR=$pkgdir
}
