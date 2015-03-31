# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=pixymon-git
pkgver=firmware_2.0.8.11.ga3ce86b
pkgrel=1
pkgdesc="pixy CMUCam5 monitor"
arch=('i686' 'x86_64')
url="https://github.com/charmedlabs/pixy"
license=('GPL')
depends=('libusb' 'qt4')
makedepends=('gcc')
provides=('pixymon')
_gitname="pixy"
source=('git+https://github.com/charmedlabs/pixy.git')
md5sums=('SKIP')

_gitname="pixy"

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/-/./g'
}

build() {
  cd "$_gitname/scripts"
  ./build_pixymon_src.sh
}

package() {
  cd "$_gitname"
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/etc/udev/rules.d/"
  cp build/pixymon/bin/PixyMon "$pkgdir/usr/bin/"
  cp src/host/linux/pixy.rules "$pkgdir/etc/udev/rules.d/"
}
