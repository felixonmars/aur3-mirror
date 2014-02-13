# Contributor: huma
pkgname=freeciv-server
appname=freeciv
pkgver=2.4.2
pkgrel=1
pkgdesc="Freeciv server"
arch=('i686' 'x86_64')
url="http://www.freeciv.org/"
license=('GPL')
depends=('readline')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/sourceforge/${appname}/${appname}-${pkgver}.tar.bz2)
md5sums=('4bf03bbe7084d3e23739f1e5b2ccc529')

build() {
  cd ${srcdir}/${appname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man --enable-client=no --with-readline || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
