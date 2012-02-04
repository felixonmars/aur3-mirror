# Contributor: Mladen Pejaković <pejakm@gmail.com>

_plname=fastuserswitch
pkgname=kdeplasma-addons-applets-${_plname}
pkgver=0.3.2
pkgrel=1
pkgdesc="Fast user switch for plasma"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=127462"
license=('GPL')
groups=('kde' 'kdeplasma-addons')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')

source=(http://kde-apps.org/CONTENT/content-files/127462-${_plname}-${pkgver}.tar.bz2)
md5sums=('107124d564564d01a4b00709fb9dcc2a')

 
build() {
  cd "$srcdir/${_plname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
  make
}

package() {
  cd "$srcdir/${_plname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}
