# Maintainer: Hanspeter Portner <agenthp at users dot sf dot net>

pkgname=oscmux
pkgver=0.1.0
pkgrel=1
pkgdesc='Open Sound Control multiplexer with filtering and delay capabilities.'
arch=(i686 x86_64)
url='https://sourceforge.net/p/omk/oscmux/oscmux'
license=('ZLIB')
depends=('eina' 'liblo')
makedepends=('cmake')
source=("http://sourceforge.net/projects/omk/files/${pkgname}-${pkgver}.tar.bz2/download")
md5sums=('14665cf476d201bd2f63a7da8493918d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}
