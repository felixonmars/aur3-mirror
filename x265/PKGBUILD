# Maintainer: kfgz <kfgz at interia pl>
# Contributor: cataphract
# Contributor: lluixhi
# Contributor: PerfectGentleman

pkgname=x265
pkgver=0.6.298.7f4537c4db7a54e4
pkgrel=1
pkgdesc="free H265/HEVC video encoder"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('yasm' 'cmake')
conflicts=('x265-hg' 'x265-10bit')
url="https://bitbucket.org/multicoreware/x265"
source=(x265.tar.gz::https://bitbucket.org/multicoreware/x265/get/stable.tar.gz)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"
  cd multicoreware-${pkgname}-*
  cd source
  echo "$(cmake . | grep "x265 version" | cut -d ' ' -f4 | tr - . | tr + .)"
  rm CMakeCache.txt
}

build() {
  cd "${srcdir}"/multicoreware-x265-*/build/linux
  cmake -G "Unix Makefiles" ../../source
  make
}

package() {
  install -D -m755 "${srcdir}"/multicoreware-${pkgname}-*/build/linux/x265 "${pkgdir}"/usr/bin/x265
  install -D -m644 "${srcdir}"/multicoreware-${pkgname}-*/build/linux/libx265.so "${pkgdir}"/usr/lib/libx265.so
  install -D -m644 "${srcdir}"/multicoreware-${pkgname}-*/build/linux/x265_config.h "${pkgdir}"/usr/include/x265_config.h
  install -D -m644 "${srcdir}"/multicoreware-${pkgname}-*/source/x265.h "${pkgdir}"/usr/include/x265.h
}
