# Contributor: Nathan Owe <ndowens04 at gmail>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=cgrep
pkgver=8.15
pkgrel=2
pkgdesc="Provides many of the features of grep, egrep, and fgrep with greatly enhanced performance"
arch=('i686' 'x86_64')
url="http://www.bell-labs.com/project/wwexptools/cgrep/"
license=('GPL')
depends=('ncurses')
makedepends=('gcc' 'make')
source=(http://downloads.sourceforge.net/cgrep/${pkgname}-${pkgver}.tar.gz)
md5sums=('7d9f15e9026d075ada9d48bc0c158941') 

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
}

