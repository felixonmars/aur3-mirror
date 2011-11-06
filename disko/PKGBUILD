# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=disko
pkgver=1.8.0
pkgrel=1
pkgdesc="Embedded Linux UI Framework"
arch=(i686 x86_64)
url="http://www.diskohq.com/"
license=('LGPL')
depends=('curl' 'freetype2' 'libjpeg-turbo' 'libpng' 'libsigc++'
         'libtiff' 'libxcomposite' 'libxml2' 'sqlite3' 'xine-lib')
makedepends=('scons')
source=("${url}repository/sources/${pkgname}_${pkgver}.tar.gz")
md5sums=('cd9121770e42ff78c89aa6b26e9ad753')

build() {
  cd "$srcdir/${pkgname}_$pkgver"

  scons prefix=/usr destdir="$pkgdir" graphics_backend=x11
}

package() {
  cd "$srcdir/${pkgname}_$pkgver"

  scons install
}
