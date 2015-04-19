# Maintainer: kfgz <kfgz at interia pl>
# Contributor: cataphract
# Contributor: lluixhi
# Contributor: PerfectGentleman
# Contributor: Bartłomiej Piotrowski

pkgname=x265-10bit
_pkgname=x265
pkgver=1.6
pkgrel=1
pkgdesc="free H265/HEVC video encoder"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('yasm' 'cmake')
conflicts=('x265-hg' 'x265')
provides=('x265')
url="https://bitbucket.org/multicoreware/x265"
source=(${url}/get/${pkgver}.tar.bz2)
md5sums=('d6fcde2d021899bc93f987cd6819a233')

build() {
  cd multicoreware-x265-*/build/linux
  [[ $CARCH == x86_64 ]] && LDFLAGS+=',-z,noexecstack'
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr ../../source -DHIGH_BIT_DEPTH=1
  make
}

package() {
  cd multicoreware-x265-*/build/linux
  make DESTDIR="${pkgdir}" install
}
