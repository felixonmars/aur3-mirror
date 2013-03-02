# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=kvkbd
pkgver=0.6
pkgrel=4
pkgdesc="A virtual keyboard for KDE"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php?content=94374"
license=('GPL')
depends=('kdelibs' 'libxtst')
makedepends=('cmake' 'automoc4' 'docbook-xsl')
source=(http://www.kde-apps.org/CONTENT/content-files/94374-kvkbd-0.6.tar.bz2)
md5sums=('342e8e7fcfc54d978615b1c2d019cbe5')

build() {
  cd "$srcdir"/kvkbd-$pkgver
  cmake -DCMAKE_EXE_LINKER_FLAGS="$CFLAGS -lX11" -DQT_QMAKE_EXECUTABLE=qmake-qt4 -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir"/kvkbd-$pkgver
  make DESTDIR="$pkgdir" install
}

