pkgname=kdeplasma-panelspacer
pkgver=0.1
pkgrel=1
pkgdesc="A plasmoid that places blank space between applets in a plasma panel"
url="http://www.kde-look.org/content/show.php/Panel+Spacer?content=89304"
arch=(i686 x86_64)
license=(GPL)
depends=('qt' 'kdelibs' 'kdebase-runtime' 'kdebase-workspace')
makedepends=('cmake' 'automoc4')
groups=()
source=(http://www.kde-look.org/CONTENT/content-files/89304-panelspacer0.1.tar.gz)
md5sums=(13b643937715d6e6e6f7a1eed7b0418a)

build() {
  cd $srcdir/plasmaspacer_0.1
   mkdir build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=release ..
    make || return 1
      make DESTDIR=$pkgdir install || return 1
      }
