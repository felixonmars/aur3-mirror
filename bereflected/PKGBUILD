#CONTRIBUTOR: Zephyr

pkgname=bereflected
pkgver=0.1
pkgrel=1
pkgdesc="Clone of Compiz Reflection effect"
url="http://kde-look.org/content/show.php/BeReflected?content=125893&PHPSESSID=b2df295b0f66443f239a38132b200f88"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=()
provides=()
install=('bereflected.install')
source=("http://kde-look.org/CONTENT/content-files/125893-${pkgname}-kwin-fx-${pkgver}.tbz")
md5sums=('f0023149fec0201806853baea6dff7c5')

build() {
  cd ${srcdir}/${pkgname}-kwin-fx

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-kwin-fx
  make DESTDIR=${pkgdir} install || return 1 
}
# vim:syntax=sh
