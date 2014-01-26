# Maintainer: hbdee <hbdee.arch@gmail.com>

pkgname=meow
_sname=meow_0.9.17-1
pkgver=0.9.17
pkgrel=1
pkgdesc="An unobtrusive and cuddly music player - KDE4 version"
arch=('i686' 'x86_64')
url=("http://meowplayer.org/")
license=('GPL')
depends=('kdebase-runtime' 'mpg123' 'taglib' 'libvorbis' 'flac' 'opusfile' 'libogg' 'speex')
makedepends=('cmake' 'automoc4')
conflicts=('meow-qt')
install="meow.install"
source=("http://meowplayer.org/${_sname}.tar.bz2")
md5sums=('bb9369ca228e0a38d75d5a59d6a2c1c8')


prepare() {
  if [[ -d build ]]
  then
    rm -rf build
  fi
   mkdir build
}

build() {
  cd build
  cmake ../${_sname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DMEOW_WITH_OPUS=1
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
