# Contributor: Holger Vogel <holger.vogel@gmail.com>

pkgname=plasma-devicenotifier_automount-utf8
pkgver=0.3
pkgrel=5
pkgdesc="An extended version of the original devicenotifier-applet which mounts the new media after it was inserted, UTF-8 support for fat32"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/New+Device+Notifier+with+Automount?content=91517"
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'patch')
conflicts=()
source=(http://kde-look.org/CONTENT/content-files/91517-devicenotifier_automount_$pkgver.tar.bz2 utf8.patch)
license=('GPL')
md5sums=('e3542d4d76fad34e661ee021969f57e4' '9589792d12b6bb05b5db9f8b16e79765')

build() {

  # UTF-8 Patch
  patch -Np1 -i $srcdir/utf8.patch || return 1

  cd $srcdir/devicenotifier_automount/src
  
  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX='/usr' ..

  make || return 1
  make DESTDIR=$pkgdir install
}
