# Maintainer: Daniel Ehlers <danielehlers@mindeye.net>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>
pkgname=b5i2iso
pkgver=0.2
pkgrel=3
pkgdesc="B5I2ISO is a very simple utility to convert a BlindWrite BIN image to the standard ISO-9660 format."
url="http://developer.berlios.de/projects/b5i2iso/"
license=('GPL')
arch=('x86_64' 'i686')
depends=('glibc')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://download.berlios.de/b5i2iso/$pkgname-$pkgver-src.tar.gz)
md5sums=(94bbff1a3a20a482153e26ca66866697)

build() {
  cd $startdir/src/$pkgname-$pkgver-src/
  make || return 1
  install -D -m755 b5i2iso $startdir/pkg/usr/bin/b5i2iso
}
