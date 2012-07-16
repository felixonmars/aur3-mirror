# Maintainer: Carl Mueller  archlinux at carlm e4ward com

pkgname=kdeplasma-applets-todo
pkgver=0.4
pkgrel=1
pkgdesc="Plasmoid that shows KOrganizer TODO list"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/todo+list?content=90706"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('automoc4' 'cmake' 'boost')
conflicts=('plasma-todo-plasmoid')
replaces=('plasma-todo-plasmoid')
source=("http://www.kde-look.org/CONTENT/content-files/90706-todo_plasmoid-$pkgver.tar.bz")
md5sums=('a99f0cc102925ef57d1cfbc8125a3146')

build() {
  mkdir build
  cd build
  cmake ../todo_plasmoid \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}