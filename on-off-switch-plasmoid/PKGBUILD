#Contributor: MeMi69 <lumpilou AT gmail DOT com>
pkgname=on-off-switch-plasmoid
pkgver=0.2
pkgrel=2
pkgdesc="Simple plasmoid that executes commands when the switch is toggled"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/On%2BOff+Switch?content=116323"
license=('GPL')
depends=('kdebase-workspace>=4.2')
makedepends=('cmake' 'automoc4')
options=()
source=(http://www.kde-look.org/CONTENT/content-files/116323-on_off_switch-$pkgver.tar.bz2)
md5sums=('89c9fd72bd1a52911bfac73dc86f2a1d')

build() {
  cd "$srcdir/on_off_switch-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
  make || return 1
  make DESTDIR="$pkgdir/" install
  cd ../plasma-applet-publictransport-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
  make || return 1
  make DESTDIR="$pkgdir/" install
  cd ../publictransport-icons-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
  make DESTDIR="$pkgdir/" install
}
