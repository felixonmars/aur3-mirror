# Maintainer: speps <speps at aur dot archlinux dot org>

_commit=80b1da32ac83babf6594fd7fb404a9b31a2958e7
pkgname=sfarkxtc
pkgver=0.r22
pkgrel=1
pkgdesc="Basic sfArk to sf2 soundfont converter"
arch=(i686 x86_64)
url="https://github.com/raboof/sfArkXTm"
license=('GPL3')
depends=('sfarklib' 'zlib')
provides=('sfarkxtm')
replaces=('sfarkxtm')
source=("https://github.com/raboof/sfarkxtc/archive/$_commit.tar.gz")
md5sums=('14b3dfb9f7017a8038185e6eabffbea5')

build() {
  cd $pkgname-$_commit
  make
}

package() {
  cd $pkgname-$_commit

  # bin
  install -Dm755 $pkgname \
    "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
