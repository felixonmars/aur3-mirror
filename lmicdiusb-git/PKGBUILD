# Maintainer: Marq Schneider <queueRAM@gmail.com>

pkgname=lmicdiusb-git
pkgver=r74.1cfd813
pkgrel=1
pkgdesc="remote GDB socket over USB for Stellaris Launchpad ICDI"
arch=('i686' 'x86_64')
url="https://github.com/utzig/lm4tools"
license=('custom')
depends=('libusb')
makedepends=('git')
source=('git://github.com/utzig/lm4tools.git')
md5sums=('SKIP')

_gitname=lm4tools

pkgver() {
  # no tags in git repo, so "git describe" just errors
  # also no version number in source, just use 'count'
  cd "$srcdir/${_gitname}/lm4tools/lmicdiusb"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_gitname}/lmicdiusb"
  make
}

package() {
  cd "$srcdir/${_gitname}/lmicdiusb"
  install -Dm755 lmicdi $pkgdir/usr/bin/lmicdi
  install -Dm644 license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}

# vim:set ts=2 sw=2 et:
