# $Id$
# Maintainer: HuJifeng <hjf004@gmail.com>

pkgname=qslive
pkgver=0.1.1
pkgrel=3
pkgdesc="A Qt front-end of sopcast,Online p2p TV Player,using phonon multimedia framework."
arch=('i686' 'x86_64')
url="https://github.com/hjf004/QSLive"
license=('GPL2')
depends=('qt' 'sopcast' 'phonon')
source=("https://github.com/downloads/hjf004/QSLive/${pkgname}-${pkgver}.tar.bz2")
sha1sums=('9c6f6e5b3fa8b9d34e3a043ba9e13ed6b921cbbf')

build() {
  cd "${srcdir}/${pkgname}"
  sed -i "s:/usr/local:/usr:g" QSLive.pro
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make INSTALL_ROOT=$pkgdir install
}

