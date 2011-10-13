# Contributor: Marq Schneider <queueRAM@gmail.com>

pkgname=pidgin-autoresize
pkgver=0.6
pkgrel=1
pkgdesc="plugin to automatically resize the height of the buddy list"
arch=('i686' 'x86_64')
url="http://raoulito.info/plugins/pidgin_autoresize/"
license=('GPL')
depends=('pidgin')
makedepends=('intltool')
options=()
#source=(http://raoulito.info/plugins/pidgin_autoresize/${pkgname}-${pkgver}.tar.gz)
source=(http://www.paldo.org/paldo/sources/pidgin-autoresize/${pkgname}-${pkgver}.tar.bz2)
#md5sums=('20ed4f027b136c5d4117b5ac3ab88994')
md5sums=('72cd9dc48016f13033060335e7a044b4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
