# Maintainer: Your Name <youremail@domain.com>

pkgname=glmark2-mir-bzr
pkgver=270
pkgrel=1
pkgdesc="OpenGL (ES) 2.0 benchmark"
arch=('i686' 'x86_64')
# https://launchpad.net/glmark2
url="http://ppa.launchpad.net/mir-team/staging/ubuntu/pool/main/g/glmark2/"
license=('GPL' 'zlib' 'custom')
groups=('unitynext')
depends=('libjpeg-turbo' 'libpng12' 'libx11' 'libxcb' 'mesa' 'mesa-libgl' 'mir-bzr' 'python2')
makedepends=('bzr')
source=('glmark2::bzr+http://bazaar.launchpad.net/~mir-team/glmark2/mir/')
sha512sums=('SKIP')

pkgver() {
  cd glmark2
  bzr revno
}

build() {
  cd "${srcdir}/glmark2"
  python2 ./waf configure --prefix=/usr --with-flavor=mir-gl,mir-glesv2
  python2 ./waf
}

package() {
  cd "${srcdir}/glmark2"
  python2 ./waf install --destdir="${pkgdir}/"
}
