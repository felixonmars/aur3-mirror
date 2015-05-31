# Maintainer: James Duley <jagduley gmail>

pkgname=openpilot
_gitname=OpenPilot
pkgver=15.02.02
pkgrel=1
pkgdesc="Ground control station with firmware for OpenPilot."
arch=('i686' 'x86_64')
url="https://openpilot.org"
license=('GPL')
depends=('qt5-svg' 'qt5-serialport' 'qt5-multimedia' 'qt5-quickcontrols' 'sdl' 'libusb')
makedepends=('python2' 'arm-none-eabi-gcc' 'arm-none-eabi-newlib' 'qt5-tools' 'qt5-quick1')
conflicts=('openpilot-git')
source=("https://wiki.openpilot.org/download/attachments/5472258/${_gitname}-RELEASE-${pkgver//_/-}.tar.gz")
md5sums=('7ecb57a60fb4e66f552a82f65771fb63')

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
