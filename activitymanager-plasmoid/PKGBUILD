# Contributor: MeMi69  MetalMilitia at gmx dot net

pkgname=activitymanager-plasmoid
pkgver=0.5
pkgrel=1
pkgdesc="Lightweight plasmoid to manage your activities effectively. At the moment you need the kde-unstable repo."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Activity+Manager+Plasmoid?content=136278"
license=('LGPL')
groups=()
depends=('kdelibs>=4.5.8')
makedepends=('gcc' 'cmake' 'automoc4')
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(http://kde-look.org/CONTENT/content-files/136278-activitymanager-$pkgver.tar.bz2)
noextract=()
md5sums=('7592bf60fafcb465fe75cd987a037ffc')
build() {
  cd $srcdir/activitymanager-$pkgver
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
