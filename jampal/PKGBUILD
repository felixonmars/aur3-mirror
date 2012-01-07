# Maintainer: dryes <joswiseman@gmail>
pkgname='jampal'
pkgver=02.01.05
pkgrel=1
pkgdesc='mp3 library, advanced ID3V1 and ID3V2 tagger, player.'
url='http://sourceforge.net/projects/jampal/'
arch=('i686' 'x86_64')
depends=('jdk7-openjdk' 'java-environment')
makedepends=('desktop-file-utils' 'polyglotman' 'rsync')
install='jampal.install'
conflicts=('tagbkup')
provides=('tagbkup')
license=('GPL3')
source=("http://sourceforge.net/projects/jampal/files/jampal/02.01.05/jampal-source-${pkgver}.tar.gz/download")
md5sums=('181d6858de0c2f902c28f7d33ed1e188')

build() {
  [ -d "${srcdir}/${pkgname}-${pkgver}-build" ] && rm -rf "${srcdir}/${pkgname}-${pkgver}-build"
  cp -r "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/${pkgname}-${pkgver}-build"
  cd "${srcdir}/${pkgname}-${pkgver}-build"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-build"
  sed -i -r 's@/usr(/bin/install)@\1@g' 'tagbkup/Makefile'
  make DESTDIR="${pkgdir}/" install
}
