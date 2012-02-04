# $Id: PKGBUILD 12/01/2009 12:55:07 $
# Maintainer: Marco Rocco <ech0s7> <mr85mr@gmail.com>

pkgname=gnome-mastermind
pkgver=0.3.1
pkgrel=1
pkgdesc="Little Mastermind game for linux in gtk and cairo"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('gtk2' 'cairo')
url="http://www.autistici.org/gnome-mastermind/"
source=(http://download.gna.org/gnome-mastermind/gnome-mastermind-$pkgver.tar.bz2)
md5sums=('e9a0f05400b642168cbd79b68c767b49')

build() {
  cd "${srcdir}/gnome-mastermind-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}


