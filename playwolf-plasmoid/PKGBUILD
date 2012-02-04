# Contributor: Carl Mueller  archlinux at carlm e4ward com

pkgname=playwolf-plasmoid
pkgver=0.8.1
pkgrel=1
pkgdesc="Kdeplasma plasmoid giving information about songs for amarok 2.0."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/show.php?content=93882"
license=('GPL2')
groups=()
depends=('kdelibs>=4.2')
makedepends=('gcc' 'cmake' 'automoc4')
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(http://playwolf.googlecode.com/files/playwolf-$pkgver.tar.bz2)
noextract=()
md5sums=('28ec4f7abfcc367c0dae67f4d423d569')
build() {
  cd $srcdir/playwolf
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
