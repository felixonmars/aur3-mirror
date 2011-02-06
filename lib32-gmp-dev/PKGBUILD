# Contributor: mightyjaym <jm.ambrosino@free.fr>

pkgname=lib32-gmp-dev
pkgver=4.3.1
pkgrel=2
pkgdesc="A free library for arbitrary precision arithmetic"
arch=('x86_64')
url="http://gmplib.org/"
license=('LGPL3')
groups=('lib32')
depends=('lib32-gcc-libs' 'gmp')
source=(ftp://ftp.archlinux.org/core/os/i686/gmp-${pkgver}-${pkgrel}-i686.pkg.tar.gz)
md5sums=('845cd2fb58a7878b74eb2891cd9e7b6a')

build() {
  mkdir -p $startdir/pkg/opt/lib32/usr/lib/
  cp -R $startdir/src/usr/lib/* $startdir/pkg/opt/lib32/usr/lib
}
