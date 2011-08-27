pkgname=rememberthemilk-googlegadget
pkgver=1.0.0
pkgrel=1
pkgdesc="Remember The Milk gadget is a simple plasmoid using google gadget."
url="http://www.kde-look.org/content/show.php/Remember+The+Milk+Google+Gadget+Plasmoid?content=101426"
arch=(i686 x86_64)
license=(GPL)
depends=('qt' 'kdelibs' 'kdebase' 'kdemod-playground-webkit-svn')
makedepends=('cmake' 'automoc4')
groups=()
source=(http://www.kde-look.org/CONTENT/content-files/101426-plasma-widget-remeberthemilk.tar.gz)
md5sums=(22af9ccd14b8578addbf227b98ca5138)

build() {
  cd $srcdir/plasma-widget-remeberthemilk-$pkgver
   mkdir build
   cd build
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=release ..
    make || return 1
    make DESTDIR=$pkgdir install || return 1
      }
