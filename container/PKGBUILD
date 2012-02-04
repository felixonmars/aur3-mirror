#CONTRIBUTOR: Zephyr

pkgname=container
pkgver=0.1
pkgrel=1
pkgdesc="Plasmoid to group other plasmoids"
url="http://www.kde-look.org/content/show.php/Container?content=112094"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdebase-workspace>=4.3')
makedepends=('cmake' 'automoc4')
conflicts=()
provides=()
source=("http://www.kde-look.org/CONTENT/content-files/112094-${pkgname}-${pkgver}.tar.bz2")
md5sums=('08302f6b0007beaa65fb73b83481396c')

build() {
  cd ${srcdir}/${pkgname}

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`

  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
# vim:syntax=sh
