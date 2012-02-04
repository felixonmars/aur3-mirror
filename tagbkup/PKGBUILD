# Maintainer: dryes <joswiseman@gmail>
pkgname='tagbkup'
_pkgname='jampal'
pkgver=02.01.05
pkgrel=1
pkgdesc='Back up and restore mp3 tags.'
url='http://jampal.sourceforge.net/tagbkup.html'
arch=('i686' 'x86_64')
conflicts=('jampal')
license=('GPL3')
source=("http://sourceforge.net/projects/jampal/files/jampal/02.01.05/jampal-source-${pkgver}.tar.gz/download")
md5sums=('181d6858de0c2f902c28f7d33ed1e188')

build() {
  [ -d "${srcdir}/${_pkgname}-${pkgver}-build" ] && rm -rf "${srcdir}/${_pkgname}-${pkgver}-build"
  cp -r "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${_pkgname}-${pkgver}-build"
  cd "${srcdir}/${_pkgname}-${pkgver}-build/tagbkup"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-build/tagbkup"
  sed -i -r 's@/usr(/bin/install)@\1@g' 'Makefile'
  make DESTDIR="${pkgdir}/" install
}
