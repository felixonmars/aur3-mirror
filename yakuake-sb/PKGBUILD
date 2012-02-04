# Maintainer: frikilinux <frikilinux at frikilinux.com.ar>
# Contributor: shamrok <szamrok@gmail.com>
 
pkgname=yakuake-sb
pkgver=2.9.6
pkgrel=1
pkgdesc="A slightly modified version of the original yakuake - a Quake-style terminal emulator based on KDE Konsole technology." 
arch=('i686' 'x86_64')
url="http://yakuake-sb.c0n.de/"
license=('GPL')
depends=('kdebase-konsole')
makedepends=('cmake' 'automoc4')
conflicts=('yakuake' 'yakuake-kde4-svn')
source=("http://yakuake-sb.c0n.de/downloads/${pkgname}-${pkgver}.tar.bz2")
md5sums=('7449890f497adfd6fd9a4ad0bf61d504')

build() {
  cd ${srcdir}
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_{SHARED,MODULE,EXE}_LINKER_FLAGS='-Wl,--no-undefined -Wl,--as-needed' \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
  make DESTDIR=${pkgdir} install
}