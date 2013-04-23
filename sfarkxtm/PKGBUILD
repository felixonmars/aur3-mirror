# Maintainer: speps <speps at aur dot archlinux dot org>

_commit=e248649
pkgname=sfarkxtm
pkgver=0.0_git
pkgrel=1
pkgdesc="Basic sfArk to sf2 soundfont converter"
arch=(i686 x86_64)
url="https://github.com/raboof/sfArkXTm"
license=('GPL3')
depends=('sfarklib' 'zlib')
source=("https://github.com/raboof/sfArkXTm/tarball/$_commit")
md5sums=('4a97ef842ebf5d98c3bdfa09bddbd042')

build() {
  cd "$srcdir/raboof-"*
  make
}

package() {
  cd "$srcdir/raboof-"*

  # bin
  install -Dm755 sfArkXTm \
    "$pkgdir/usr/bin/sfArkXTm"
}

# vim:set ts=2 sw=2 et:
