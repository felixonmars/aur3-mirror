# Contributor: t3ddy  <t3ddy1988 "at" gmail {dot} com>
# Contributor: k3vin <kev "at" k3v {dot} in>

pkgname=colibri
pkgver=0.3.0
pkgrel=1
pkgdesc="Colibri provides an alternative to KDE4 Plasma notifications."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Colibri?content=117147"
provides=('notification-daemon')
license=('GPL')
depends=('kdebase-workspace>=4.4')
makedepends=('gcc' 'cmake' 'automoc4')
install=colibri.install
source=(http://download.kde.org/stable/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('6b39ca00645d8557886577e1366deecd')
 
build() {
  cd $srcdir/${pkgname}-${pkgver}
  
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ../
  make
}

package() {
  cd $srcdir/${pkgname}-${pkgver}/build

  make DESTDIR="$pkgdir/" install
}