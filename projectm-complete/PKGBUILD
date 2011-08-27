# Maintainer: Nickolay Stepanenko <nixtrian at gmail dot com>

pkgname=projectm-complete
pkgver=2.0.1
pkgrel=1
pkgdesc="A music visualizer which uses 3D accelerated iterative image based rendering (all components)"
arch=('i686' 'x86_64')
url="http://projectm.sourceforge.net/"
license=('GPL')
depends=('ftgl' 'glut' 'glew' 'libvisual-plugins' 'pulseaudio')
provides=('projectm' 'projectm-qt' 'projectm-libvisual' 'projectm-libvisual-alsa')
conflicts=('projectm' 'projectm-qt' 'projectm-libvisual' 'projectm-libvisual-alsa')
makedepends=('pkgconfig' 'xproto' 'cmake')
source=(http://downloads.sourceforge.net/sourceforge/projectm/files/$pkgver/projectM-complete-$pkgver-Source.tar.gz)
md5sums=('9d32fa1357622c7a945a2e10620ee945')

build() {
  cd $srcdir/projectM-complete-$pkgver-Source/src || return 1
  sed 's/OPTION(INCLUDE-PROJECTM-LIBVISUAL-ALSA "Build experimental libvisual \/ alsa input standalone client (NEW!)" OFF)/OPTION(INCLUDE-PROJECTM-LIBVISUAL-ALSA "Build experimental libvisual \/ alsa input standalone client (NEW!)" ON)/' -i CMakeLists.txt ||return 1
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Debug . || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  rm -rf $srcdir/projectM-complete-$pkgver-Source
}
