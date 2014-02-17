# Maintainer: Peter Ivanov <ivanovp@gmail.com>
pkgname=bslsh
pkgver=2.6
pkgrel=1
pkgdesc="MSP430 BSL frontend for Linux/Un*x"
url="http://llg.cubic.org/dmx43/bslsh.html"
depends=('glibc' 'readline' 'termcap' 'srecord')
#makedepends=('sed')
source=(http://llg.cubic.org/dmx43/$pkgname-$pkgver.tar.gz)
md5sums=('5acf1baf0d82b65dacf582d532000341')
arch=('i686' 'x86_64')
license=('GPL')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
}

package() {
  cd $startdir/src/$pkgname-$pkgver
  install -d $startdir/pkg/$pkgname/bin
  make PREFIX=$startdir/pkg/$pkgname install
}
