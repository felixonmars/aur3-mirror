# Maintainer: Gerald Lutter <gerald@itzgrund.net>

pkgname=dtaus
pkgver=0.9
pkgrel=2
pkgdesc="dtaus is a little program that converts controlfiles to dtaus files and the other way round"
arch=('i686' 'x86_64')
depends=('glibc')
url="http://www.infodrom.org/"
license=('GPL')
source=(http://www.infodrom.org/projects/dtaus/download/dtaus-0.9.tar.gz)
md5sums=('0703e37f8ed303ceb2e78ece5650bf05')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  
  # install binary
  mkdir -p ${pkgdir}/usr/bin
  cp dtaus ${pkgdir}/usr/bin/
 
  # install manpages
  gzip dtaus.1
  gzip dtaus.5
  mkdir -p ${pkgdir}/usr/share/man/man1
  mkdir -p ${pkgdir}/usr/share/man/man5
  cp dtaus.1.gz ${pkgdir}/usr/share/man/man1/
  cp dtaus.5.gz ${pkgdir}/usr/share/man/man5/

  # install other documentation
  mkdir -p ${pkgdir}/usr/share/dtaus
  cp ChangeLog ${pkgdir}/usr/share/dtaus
  cp COPYING ${pkgdir}/usr/share/dtaus
  cp README ${pkgdir}/usr/share/dtaus
  cp TODO ${pkgdir}/usr/share/dtaus
}
