# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Stefan Lohmaier <noneus@@@@@@@noneus.DOT:de>
pkgname=nmrename
pkgver=0.1
pkgrel=1
pkgdesc="Mass renaming tool for the cmdline"
arch=('i686' 'x86_64')
url="http://nmrename.sf.net"
license=('GPL')
depends=('glibc' 'libexif')
makedepends=('cmake')
source=(http://sourceforge.net/projects/nmrename/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('b235fbdbeddee4f770251e3f8f51bebd')

build() {

  mkdir -p $pkgname/usr/bin

  cd $srcdir/$pkgname-$pkgver

  cmake .
  make || return 1

  install -T -D -m 755 src/nmrename $pkgdir/usr/bin/nmrename
}

# vim:set ts=2 sw=2 et:
