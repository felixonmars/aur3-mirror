# Maintainer: Carl Mueller  archlinux at carlm e4ward com

pkgname=plasma-todo-plasmoid
pkgver=0.4
pkgrel=1
pkgdesc="Kdeplasma plasmoid showing a todo list using korganizer."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/todo+list?content=90706"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('automoc4' 'cmake' 'boost')
source=(http://www.kde-look.org/CONTENT/content-files/90706-todo_plasmoid-$pkgver.tar.bz)
md5sums=('a99f0cc102925ef57d1cfbc8125a3146')

build() {
  cd $srcdir
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../todo_plasmoid || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
