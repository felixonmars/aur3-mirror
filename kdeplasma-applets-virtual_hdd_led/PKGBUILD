# Maintainer: Antonio Rojas < nqn1976 @ gmail.com >

pkgname=kdeplasma-applets-virtual_hdd_led
_appname=virtual_hdd_led
pkgver=0.5
pkgrel=1
pkgdesc="This applet shows the activity and the current status of the selected harddisk"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/virtual_hdd_led?content=126571"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=(http://crissi.linux-administrator.com/linux/${_appname}/${_appname}-$pkgver.tar.bz2)
md5sums=('a7dab35dac34830b89e2186ff34da69f')
install=$pkgname.install

build() {
  cd $srcdir/${_appname}-$pkgver
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd $srcdir/${_appname}-$pkgver/build
  make DESTDIR="$pkgdir" install
}
