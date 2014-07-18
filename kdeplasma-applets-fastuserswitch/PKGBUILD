# Maintainer: Bart De Vries <devriesb@gmail.com>
# Contributer: Mladen Pejaković <pejakm@gmail.com>

pkgname=kdeplasma-applets-fastuserswitch
pkgver=0.3.4
pkgrel=1
pkgdesc="Fast user switch for plasma"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=127462"
license=('GPL')
groups=('kde' 'kdeplasma-addons')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('kdeplasma-addons-applets-fastuserswitch')
replaces=('kdeplasma-addons-applets-fastuserswitch')
source=("https://github.com/mogwa1/fast_user_switch/archive/${pkgver}.tar.gz")
md5sums=('fd2c12060f507b95db7cc10c6bf7a92c')

build() {
  mkdir build
  cd build
  cmake ../fast_user_switch-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
