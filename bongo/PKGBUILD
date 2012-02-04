# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

pkgname=bongo
pkgver=0.6.1
pkgrel=1
pkgdesc="Bongo is an easy-to-use mail and calendar system, offering a simple yet powerful user interface. The goal is to make sharing, organisation, and communication simpler, quicker, and more useful."
arch=('i686' 'x86_64')
url="http://www.bongo-project.org/"
license=('GPLv2')
depends=('bison>=1.875' 'gettext' 'openldap' 'gnutls' 'popt' 'python>=2.3.0' 'doxygen' 'libtool' 'flex' 'gmime' 'python-lxml' 'libical' )
optdepends=('apache')
makedepends=('cmake')
source=(http://download.gna.org/bongo/release/${pkgname}-${pkgver}.tar.bz2)
md5sums=('c9aff202b6cb49be5a74c388e1fa14a0')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr/local/bongo -DBONGO_USER=bongo
  make
  make install || return 1
  cd /usr/local/bongo
  ./sbin/bongo-config install

}
