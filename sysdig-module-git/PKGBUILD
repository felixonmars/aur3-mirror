# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>
pkgname=sysdig-module-git
pkgver=0.1.72.r1043.g6598c30
pkgrel=1
pkgdesc="Open source system-level exploration and troubleshooting tool"
arch=('i686' 'x86_64')
url="http://www.sysdig.org/"
license=('GPL2')
makedepends=('git' 'gcc' 'make' 'cmake' 
             'linux-headers>=3.18' 'linux-headers<3.19')
conflicts=('sysdig-module')
provides=('sysdig-module-git')
source=("${pkgname}"::'git+https://github.com/draios/sysdig.git')
md5sums=('SKIP')
install="sysdig-module-git.install"

_extramodules=extramodules-3.18-ARCH

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  cmake -DSYSDIG_VERSION="${pkgver}" ..
  cd driver
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  cd build/driver
  install -dm755 "${pkgdir}/usr/lib/modules/${_extramodules}/"
  install -m644 sysdig-probe.ko "${pkgdir}/usr/lib/modules/${_extramodules}/"
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} +
}

# vim:set ts=8 sts=2 sw=2 et:
