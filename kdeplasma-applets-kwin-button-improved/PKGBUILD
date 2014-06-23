# Contributor: George Brooke <george+arch.aur@george-brooke.co.uk>
# Maintainer: ava1ar <mail(at)ava1ar(dot)info>

pkgname=kdeplasma-applets-kwin-button-improved
pkgver=0.6
pkgrel=1
pkgdesc="Displays window buttons (maximise, minimise, close, etc.) in a plasmoid."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/KWinButton+applet+improved?content=143971"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=('http://kde-look.org/CONTENT/content-files/143971-kwinbuttonapplet-improved-0.6.tar.gz')
sha1sums=('ac557083fc29abcbe7453d1cbe26f392ff295e6d')

build() {
  cd "${srcdir}"/kwinbuttonapplet-improved-${pkgver}
  mkdir build && cd build
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "${srcdir}"/kwinbuttonapplet-improved-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
