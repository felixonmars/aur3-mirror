# Maintainer: speps <speps at aur dot archlinux dot org>

_commit=ee08d0c8f6a872068c84fde5f4e6f6ee1d777f18
pkgname=sfarklib
pkgver=2.23.r32
pkgrel=1
pkgdesc="Library for decompressing sfArk soundfonts."
arch=(i686 x86_64)
url="https://github.com/raboof/sfArkLib"
license=('GPL3')
depends=('glibc')
source=("https://github.com/raboof/sfArkLib/archive/$_commit.tar.gz")
md5sums=('f8c3f93c68459f4c92041cd27bc69b75')

build() {
  cd sfArkLib-$_commit
  make
}

package() {
  cd sfArkLib-$_commit

  # lib
  install -Dm755 libsfark.so \
    "$pkgdir/usr/lib/libsfark.so"

  # header
  install -Dm644 sfArkLib.h \
    "$pkgdir/usr/include/sfArkLib.h"
}

# vim:set ts=2 sw=2 et:
