# Contributors: Mladen Pejaković <pejakm@gmail.com>

pkgname=liblazy
pkgver=0.2
pkgrel=1
pkgdesc="Simple and easy to use library that provides convenient functions for sending messages over the D-Bus daemon"
url="http://www.freedesktop.org/wiki/Software/liblazy"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('pkg-config' 'dbus')
source=(http://repository.slacky.eu/slackware-12.0/libraries/liblazy/0.2/src/${pkgname}-${pkgver}.tar.bz2)

md5sums=('d1a91efd155dcd1467c2768447d01e42')

build() {
  cd ${srcdir}/$pkgname-${pkgver} || return 1
  ./configure --prefix=/usr || return 1
  make -s || return 1
  make DESTDIR="$pkgdir" install || return 1
}
