# Contributor: Splashy <splash at open-web dot fr>

pkgname=kdeplasma-applets-playwolf-elements
pkgver=0.2.2
pkgrel=1
pkgdesc="This is a set of Plasma Widgets thoughts to be used in conjunction with Grouping Desktop to manage your current music."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/PlayWolf+Elements?content=127019"
license=('GPL2')
groups=()
depends=('kdelibs>=4.2')
makedepends=('gcc' 'cmake' 'automoc4')
provides=()
conflicts=()
replaces=('kdeplasma-playwolf-elements')
backup=()
options=()
source=(http://kde-look.org/CONTENT/content-files/127019-playwolf-elements-$pkgver.tar.bz2)
noextract=()
md5sums=('d2c8c95ba7774dc1ac90c0c62540b064')
build() {
  cd $srcdir/playwolf-elements
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
