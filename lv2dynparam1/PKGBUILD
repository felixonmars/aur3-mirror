# Contributor: Nate Slottow (m00tp01nt) <nslottow AT gmail DOT com>
# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=lv2dynparam1
pkgver=2
pkgrel=3
pkgdesc="LV2 plugin interface extension that enables dynamic plugin parameters."
arch=('i686' 'x86_64')
url=('http://home.gna.org/lv2dynparam/')
license=('GPL')
depends=('glibc')
makedepends=('lv2core')
provides=('lv2dynparam')
options=('!libtool')
source=(http://download.gna.org/lv2dynparam/${pkgname}-${pkgver}.tar.bz2)
md5sums=('708a7ce7e6604af2a58f521e343509d5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix="/usr" || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
