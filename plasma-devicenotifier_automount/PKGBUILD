# Contributor: Lucio Zara <pennega@gmail.com>

pkgname=plasma-devicenotifier_automount
pkgver=0.4alpha1
pkgrel=1
pkgdesc="An extended version of the original devicenotifier-applet which mounts the new media after it was inserted"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/New+Device+Notifier+with+Automount?content=91517"
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=()
source=(http://kde-look.org/CONTENT/content-files/91517-devicenotifier_automount_$pkgver.tar.bz2)
license=('GPL')
md5sums=('8cd1c985fc22ef3d58467fec1d968556')

build() {
  cd $srcdir/devicenotifier_automount_$pkgver/src
  
  mkdir build
  cd build

  cmake ../src -DCMAKE_INSTALL_PREFIX='/usr' ..

  make || return 1
  make DESTDIR=$pkgdir install
}
