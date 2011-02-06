# Maintainer: Nicholas <rothsdad at gmail com>

pkgname=lua-gd-git
pkgver=2.0.33r2
pkgrel=2
pkgdesc="An image manipulation library based on the GD library."
arch=('i686' 'x86_64')
url="https://github.com/hoelzro/luagd"
license=('GPL')
depends=('gd' 'lua' 'git' 'pkg-config')
conflicts=('lua-gd')
source=('Makefile.arch')
md5sums=('79401dac6157becd2cb0ed809fe0e052')

build() {
  git clone https://github.com/hoelzro/luagd.git
  cd luagd
  make -f ../Makefile.arch
  install -D -m755 gd.so $pkgdir/usr/lib/lua/5.1/gd.so
}
