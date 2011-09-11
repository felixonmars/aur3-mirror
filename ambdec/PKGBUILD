#Maintainer: Philipp Überbacher <murks at lavabit dot com>
#Contributor: masutu <masutu dot arch at googlemail dot com>
pkgname=ambdec
pkgver=0.5.1
pkgrel=1
pkgdesc='An Ambisonic decoder for up to 3rd Order.'
arch=('i686' 'x86_64')
url='http://kokkinizita.linuxaudio.org'
license=('GPL')
depends=('clthreads' 'clxclient' 'jack' 'libpng')
source=(http://kokkinizita.linuxaudio.org/linuxaudio/downloads/${pkgname}-${pkgver}.tar.bz2)
md5sums=('62a6e0f172d887a20ebd566f9ccb6205')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/source"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/source"
  make PREFIX=${pkgdir}/usr install
}
