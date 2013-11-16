# Maintainer: Behem0th <grantipak@gmail.com>

pkgname=libvdpau-va-gl
pkgver=0.2.1
pkgrel=1
pkgdesc='VDPAU driver with OpenGL/VAAPI backend'
arch=('i686' 'x86_64')
url='https://github.com/i-rinat/libvdpau-va-gl'
license=('LGPLv3')
depends=('libvdpau' 'libva' 'libgl' 'ffmpeg' 'glu')
makedepends=('cmake')
provides=('libvdpau-va-gl')
source=('https://github.com/i-rinat/${pkgname}/archive/v'${pkgver}'.zip')
md5sums=('bb14c2ec9763c025b1abde96df845512')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}

