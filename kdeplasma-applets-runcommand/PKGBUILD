# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=kdeplasma-applets-runcommand
pkgver=2.5
pkgrel=1
pkgdesc="A convenient plasmoid to run commands without using a terminal or KRunner."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Run+Command?content=91495"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('cmake' 'gcc' 'automoc4')
conflicts=('plasma-runcommand-plasmoid')
source=(http://www.kde-look.org/CONTENT/content-files/91495-runcommand-$pkgver.tar.bz2)

build() {

    cd $srcdir/runcommand-$pkgver
    mkdir build
    cd build

    cmake -DCMAKE_INSTALL_PREFIX=/usr ../
    make
}

package() {

    cd $srcdir/runcommand-$pkgver/build
    make DESTDIR=$pkgdir install || return 1
}
md5sums=('669f84f79667f7cd902e2ac78fc5f493')
