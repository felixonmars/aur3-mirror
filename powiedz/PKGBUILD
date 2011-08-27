# Contributor: Krzemin <pkrzemin@o2.pl>

pkgname=powiedz
pkgver=1.0
pkgrel=1
pkgdesc="A Polish speech synthesizer"
arch=('i686' 'x86_64')
license=('GPL')
url=("http://kadu.net/download/additions/powiedz-1.0.tgz")
source=("http://kadu.net/download/additions/${pkgname}-${pkgver}.tgz")
md5sums=('e41665cc88c096473d48ff2fd32c4646')

build() {
  cd $startdir/src/$pkgname
  make -f Makefile_plain || return 1
  install -D powiedz $startdir/pkg/usr/bin/powiedz
}
