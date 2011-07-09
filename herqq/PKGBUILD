pkgname=herqq
pkgver=1.0.0
pkgrel=1
pkgdesc="Herqq UPnP (HUPnP) is a software library for building UPnP devices"
arch=('i686' 'x86_64')
url="http://www.herqq.org/"
license=('GPL')
depends=('qt')
source=("http://downloads.sourceforge.net/sourceforge/hupnp/${pkgname}-${pkgver}.zip")
md5sums=('45a0632f7c7b64bc0fdab852d36c1e61')
groups=('kde4-git')

build() {
  cd $startdir/src/${pkgname}-${pkgver}/
  qmake PREFIX=/usr
  make
}

package() {
  cd  $startdir/src/${pkgname}-${pkgver}
  make INSTALL_ROOT=${pkgdir} install
}
