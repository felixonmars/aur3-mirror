# Maintainer: dieghen89 <dieghen89@gmail.com>
pkgname="plasma-wallpaper-dreamdesktop"
pkgver="0.3.0"
pkgrel=3
pkgdesc="An innovative animated desktop wallpaper for KDE"
arch=(any)
url="http://www.jarzebski.pl/projekty/dreamdesktop.html"
license=('GPL')
groups=(kde)
depends=('kdelibs' 'ffmpeg')
makedepends=('automoc4' 'cmake')
optdepends=()
install=
source=("http://www.jarzebski.pl/files/dreamdesktop/$pkgname-$pkgver.tar.bz2")
md5sums=('da6213df1c214eabf0640ec11fdfb398')

build() {
  cd "$srcdir/$pkgname"
  mkdir -p build
  cd build/
  cmake .. \
	-DCMAKE_INSTALL_PREFIX=`kde4-config --prefix=/usr`\
	-DQT_QMAKE_EXECUTABLE=qmake-qt4
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
