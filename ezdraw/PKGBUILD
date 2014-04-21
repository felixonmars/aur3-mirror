# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=ezdraw
pkgver=1.2
pkgrel=1
pkgdesc="C graphical toolbox"
arch=('i686' 'x86_64')
url="http://pageperso.lif.univ-mrs.fr/~edouard.thiel/ez-draw/"
license=('LGPL')
depends=('libxext')
makedepends=('')
source=("http://pageperso.lif.univ-mrs.fr/~edouard.thiel/EZ-Draw-${pkgver}.tgz"
	"CMakeLists.txt")
md5sums=('d17a6815acd31782adc8a6eceadb4e53'
 	'SKIP')

build() {
  cd "$srcdir/EZ-Draw-$pkgver"
  cp "$srcdir"/CMakeLists.txt .
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/EZ-Draw-$pkgver/build"
  make DESTDIR="$pkgdir" install
}

