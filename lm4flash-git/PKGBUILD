# Maintainer: Marq Schneider <queueRAM@gmail.com>

pkgname=lm4flash-git
pkgver=0.1.3.r1cfd813
pkgrel=1
pkgdesc="firmware flashing tool for Stellaris Launchpad ICDI"
arch=('i686' 'x86_64')
url="https://github.com/utzig/lm4tools"
license=('GPL')
depends=('libusb')
makedepends=('git')
source=('git://github.com/utzig/lm4tools.git')
md5sums=('SKIP')

_gitname=lm4tools

pkgver() {
  # no tags in git repo, so "git describe" just errors
  cd "$srcdir/${_gitname}/lm4tools/lm4flash"
  _version=`grep "LM4Flash version" lm4flash.c | sed 's/^.*[^0-9]\([0-9]*\.[0-9]*\.[0-9]*\).*$/\1/'`
  _gitrev=`git rev-parse --short HEAD`
  echo "${_version}.r${_gitrev}"
}

build() {
  cd "$srcdir/${_gitname}/lm4flash"
  make
}

package() {
  cd "$srcdir/${_gitname}/lm4flash"
  install -Dm755 lm4flash "$pkgdir/usr/bin/lm4flash"
}

# vim:set ts=2 sw=2 et:
