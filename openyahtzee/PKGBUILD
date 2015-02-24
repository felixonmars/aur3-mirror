# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=openyahtzee
pkgver=1.9.1
pkgrel=1
pkgdesc="A full-featured wxWidgets version of the classic dice game Yahtzee."
arch=('i686' 'x86_64')
url="http://www.openyahtzee.org/"
license=('GPL2')
depends=('wxgtk2.8')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('b45d42abe3f62741043e59d2ba9b83e9')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config-2.8
}

build() {
  cd $srcdir/$pkgname-$pkgver  
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}