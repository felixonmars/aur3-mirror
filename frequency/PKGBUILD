# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=frequency
pkgver=0.9.14
pkgrel=1
pkgdesc="Unix console client for EFnet IRC Network."
arch=('i686' 'x86_64')
url="http://forum.efnet.org/console-client-i-wrote-a-while-ago-frequency--p5496.html"
license=('GPL2')
install=$pkgname.install
source=(http://countercultured.net/frequency.tar.gz)
md5sums=('5a38d80db08f575fd84784e282bb082b')

prepare() {
  cd $srcdir/$pkgname

  ./configure
}

build() {
  cd $srcdir/$pkgname

  make
}

package() {
  cd $srcdir/$pkgname

  mkdir -p $pkgdir/usr/share/doc/frequency
  install -Dm755 fz $pkgdir/usr/bin/fz
  cd config/
  install -Dm644 help logo servers $pkgdir/usr/share/doc/frequency
}