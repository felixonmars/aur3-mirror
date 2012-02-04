# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Nick Parastatidis <nparasta@auth.gr>
pkgname=englabgui
pkgver=0.3.0
pkgrel=1
pkgdesc="Graphical User Interface for Englab calculations platform" 
url="http://www.englab.org/"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('libenglab' 'qt>=4.5')
source=(http://downloads.sourceforge.net/englab/$pkgname-$pkgver.tar.gz 'makefile.patch')
md5sums=('8fdcbb7133a61550e06ece1b3f527dfa' '5ae3def716d8b1ea16d31b5fc36e21ee')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr CXXFLAGS="-O0" || return 1
  patch -Rn src/makefile ../../makefile.patch
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
