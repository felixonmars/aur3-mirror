# Contributor: Stevek - stevekej@gmail.com

pkgname=kdeplasma-addons-applets-qmpdplasmoid
pkgver=0.0.8
pkgrel=1
pkgdesc="A small mpd client plasmoid for KDE4"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/qmpdplasmoid?content=140412"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'make' 'automoc4')
conflicts=()
source=(http://kde-look.org/CONTENT/content-files/140412-qmpdplasmoid-$pkgver.tar.gz)
md5sums=('8a8b7898b3be3c3b812e1cfac4590e21')
build() {

    cd $srcdir/qmpdplasmoid-$pkgver
    mkdir build
    cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1

}