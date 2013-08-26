# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=functy
pkgver=0.25
pkgrel=1
pkgdesc="A 3D graph drawing package with support for Cartesian and spherical functions"
arch=('i686' 'x86_64')
url="http://$pkgname.sourceforge.net/"
license=('MIT')
depends=('gtkglext' 'freeglut' 'libglade')
makedepends=('make' 'symbolic')
source=("http://sourceforge.net/projects/${pkgname}/files/Functy/${pkgver}/${pkgname}-${pkgver}.0-src.zip")
md5sums=('cf3b9a71116ee7ed0e5e40990102771c')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR=$pkgdir install
  install -D COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
