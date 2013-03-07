# Maintainer: <kfgz at interia dot pl>
# Contributors:
#   Elmo Todurov <todurov at gmail dot com>
#   henning mueller <henning at orgizm dot net>

pkgname=netcat6
pkgver=1.0
pkgrel=3
pkgdesc='Improved IPv6-ready version of Netcat, the network piping application'
arch=('i686' 'x86_64')
url='http://www.deepspace6.net/projects/netcat6.html'
license=(GPL)
depends=(bluez)
makedepends=(glibc)
source=(http://fossies.org/unix/privat/nc6-${pkgver}.tar.bz2)
md5sums=('5074bc51989420a1f68716f93322030f')

build() {
  cd "${srcdir}"/nc6-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}"/nc6-${pkgver}
  make DESTDIR="${pkgdir}" install
}
