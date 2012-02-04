# Contributor: Gaurish Sharma <contact@gaurishsharma.com>
pkgname=kwin-effect-pulse
pkgver=0.3.1
pkgrel=1
pkgdesc="Pulse is a desktop effect plugin for KWin.When a window appears, it zooms in and pulses with a fading ghost image of itself"
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-look.org/content/show.php/Pulse?content=122833"
depends=('kdebase-workspace>=4.4.0')
makedepends=('cmake')
source=(http://github.com/jinliu/${pkgname}/tarball/v${pkgver})
md5sums=('7f30b803779afb7f9d01134f5b19dac6')
build() {
  cd "$srcdir/jinliu-${pkgname}"-*
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) -DCMAKE_BUILD_TYPE=Release .. || return 1
  make DESTDIR=${pkgdir} install || return 1

}