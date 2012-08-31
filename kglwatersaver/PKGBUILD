# Contributor: twosouls82 <twosouls82@gmail.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>
# Maintainer: Andrew Panchenko <panchenkoac@gmail.com>
pkgname=kglwatersaver
_srcname=kwatersaver4
pkgdesc="Screensaver for KDE using OpenGL for visual effects."
url="http://kwatersaver.c0n.de/"
license=('GPL2')
pkgver=0.7
pkgrel=4
arch=('i686' 'x86_64')
depends=('libgl' 'kdebase-workspace' )
makedepends=('make' 'cmake' 'automoc4' )
install=${pkgname}.install
source=(http://kwatersaver.c0n.de/downloads/${_srcname}-${pkgver}.tar.bz2)
md5sums=('c7a9b936d340ff338a3864961f81fd38')

build()
{
  cd ${srcdir}/${_srcname}-$pkgver
  rm -Rf build
  ./configure --prefix=/usr
  cd build
  make || return 1
}

package() {
  cd ${srcdir}/${_srcname}-$pkgver/build
  make DESTDIR=${pkgdir} install
}
