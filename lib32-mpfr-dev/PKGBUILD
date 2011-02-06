# Contributor: mightyjaym <jm.ambrosino@free.fr>

pkgname=lib32-mpfr-dev
pkgver=2.4.1
pkgrel=1
pkgdesc="A free library for arbitrary precision arithmetic"
arch=('x86_64')
url="http://www.mpfr.org/"
license=('LGPL3')
groups=('lib32')
depends=('lib32-gcc-libs' 'mpfr')
source=(ftp://ftp.archlinux.org/core/os/i686/mpfr-${pkgver}-${pkgrel}-i686.pkg.tar.gz)

build() {
  mkdir -p $startdir/pkg/opt/lib32/usr/lib/
  cp -R $startdir/src/usr/lib/* $startdir/pkg/opt/lib32/usr/lib
}
md5sums=('596494128a7d5cb53732eacf515a7746')
