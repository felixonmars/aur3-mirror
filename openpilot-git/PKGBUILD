# Maintainer: James Duley <jagduley gmail>

pkgname=openpilot-git
_gitname=OpenPilot
pkgver=15.02+r68_gbe9f4ae
pkgrel=1
pkgdesc="Ground control station with firmware for OpenPilot (next branch)."
arch=('i686' 'x86_64')
url="https://openpilot.org"
license=('GPL')
depends=('qt5-svg' 'qt5-serialport' 'qt5-multimedia' 'qt5-quickcontrols' 'sdl' 'libusb')
makedepends=('git' 'python2' 'arm-none-eabi-gcc' 'arm-none-eabi-newlib' 'qt5-tools' 'qt5-quick1')
conflicts=('openpilot')
source=("$_gitname::git://git.openpilot.org/OpenPilot.git#branch=next")
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  python2 make/scripts/version-info.py --format='${LABEL}' | sed -r 's/RELEASE-//;s/-/_/g'
}

build() {
  cd "$srcdir/$_gitname"
  make opfw_resource openpilotgcs
}

package() {
  cd "$srcdir/$_gitname/"
  make prefix=/usr DESTDIR=$pkgdir install

  cd "$srcdir/$_gitname/package/linux"
  install -d "$pkgdir/usr/lib/udev/rules.d"
  cp 45-openpilot-permissions.rules "$pkgdir/usr/lib/udev/rules.d/55-openpilot.rules"
}
