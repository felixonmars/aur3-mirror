# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alois Belaska <lloyd@centrum.cz>

pkgname=fgetty
pkgver=0.7
pkgrel=5
pkgdesc="A mingetty stripped of the printfs"
arch=('i686' 'x86_64')
url='http://www.fefe.de/fgetty/'
license=('GPL')
depends=()
makedepends=('dietlibc')
options=(zipman)
source=(http://www.fefe.de/fgetty/${pkgname}-${pkgver}.tar.bz2)
md5sums=('1ecb286ffe3a87ef160eefc38e9038a5')

build() {
  export PATH=$PATH:/opt/diet/bin
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  export PATH=$PATH:/opt/diet/bin
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  mkdir -p $pkgdir/usr/{bin,share}
  mv $pkgdir/{s,}bin/* $pkgdir/usr/bin/
  mv $pkgdir/usr/{man,share/}
  rmdir $pkgdir/{s,}bin
}
