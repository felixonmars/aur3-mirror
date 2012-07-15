# Maintainer: George Brooke <george+arch.aur@george-brooke.co.uk>
pkgname=kdeplasma-applet-kwin-button-improved
pkgver=0.5
pkgrel=1
pkgdesc="Displays window buttons (maximise, minimise, close, etc.) in a plasmoid."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/KWinButton+applet+improved?content=143971"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('kwinbuttonapplet')
source=(http://dl.dropbox.com/u/4514366/kwinbuttonapplet-improved-0.5.tar.gz)
md5sums=('1b76086c00541fa16a248d2850cc380a')

build() {
  cd "$srcdir/kwinbuttonapplet-improved-${pkgver}/"
  mkdir build && cd build
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "$srcdir/kwinbuttonapplet-improved-${pkgver}/build/"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
