# Contributor: Jose Alcalá  <gskbyte AT gmail DOT com>

pkgname=luna-enhanced-plasmoid
pkgver=1.90
pkgrel=1
pkgdesc="An enhanced version of the original Luna plasmoid, which allows background disabling and custom theme selection."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Luna+enhanced?content=106492"
license=('GPL')
depends=('kdelibs' 'kdebase-runtime' 'kdebase-workspace')
makedepends=('make' 'cmake' 'automoc4')
install=$pkgname.install
source=(http://kde-look.org/CONTENT/content-files/106492-luna-enhanced.tar.gz)
md5sums=('1584388b96623d96deaf9406e209a33d')
build() {
  cd $srcdir/luna-enhanced/
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
