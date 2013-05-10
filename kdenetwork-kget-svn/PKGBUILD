# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdenetwork-kget-svn
pkgver=1353626
pkgrel=1
pkgdesc="Download Manager"
arch=('i686' 'x86_64')
url="http://kde.org/applications/internet/kget/"
license=('GPL')
depends=('kdelibs')
makedepends=('subversion')
provides=('kdenetwork-kget')
conflicts=('kdenetwork-kget' 'kdenetwork4-svn')
source=('svn://anonsvn.kde.org/home/kde/trunk/KDE/kdenetwork')
md5sums=('SKIP')

pkgver() {
  cd kdenetwork
  svnversion | tr -d [A-z]
}

build() {
  mkdir -p build
  cd build
  cmake ../kdenetwork \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_filesharing=OFF \
    -DBUILD_kdnssd=OFF \
    -DBUILD_kopete=OFF \
    -DBUILD_kppp=OFF \
    -DBUILD_krdc=OFF \
    -DBUILD_krfb=OFF
  make
}

package() {
  cd build/kget
  make DESTDIR="${pkgdir}" install
}
