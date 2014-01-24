# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Alexandre BIQUE <bique.alexandre@gmail.com>
pkgname=lpcflash
pkgver=0.2.4
pkgrel=2
pkgdesc="Flash Utility for NXP LPC2xxx ARM7 microcontrollers."
arch=('i686' 'x86_64')
url="http://code.google.com/p/lpcflash/"
license=('GPL')
source=(http://lpcflash.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('55ef89954939a75fe0e4b0f5cebc3a10')

build() {
  cd $startdir/src/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {

  cd $startdir/src/$pkgname-$pkgver

  make DESTDIR=$startdir/pkg/$pkgname install
}

# vim:set ts=2 sw=2 et:
