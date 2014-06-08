pkgname=kdedeco-domino-kde4
pkgver=0.4
pkgrel=3
pkgdesc="KDE4 port of the Domino window decoration"
url="http://www.kde-look.org/content/show.php/Domino?content=95595"
arch=(i686 x86_64)
license=(GPL)
depends=('qt4' 'kdelibs' 'kdebase-workspace')
makedepends=('cmake' 'automoc4')
groups=()
source=(http://www.kde-look.org/CONTENT/content-files/95595-kde4-windeco-domino-0.4.tar.bz2)
md5sums=(1520c6bb27685a387a56e4eeb9d8041c)

build() {
  cd $srcdir/kde4-windeco-domino-$pkgver
   mkdir build
   cd build
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=release ..
    make || return 1
    make DESTDIR=$pkgdir install || return 1
      }
