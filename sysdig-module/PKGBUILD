# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>
pkgname=sysdig-module
pkgver=0.1.94
pkgrel=1
pkgdesc="Open source system-level exploration and troubleshooting tool"
arch=('i686' 'x86_64')
url="http://www.sysdig.org/"
license=('GPL2')
makedepends=('gcc' 'make' 'cmake' 
             'linux-headers>=3.18' 'linux-headers<3.19')
conflicts=('sysdig-module-git')
provides=('sysdig-module')
source=("https://github.com/draios/sysdig/archive/${pkgver}.tar.gz")
sha1sums=('3283270f1a61be8dc70353cf872442b3789a64fa')
install="sysdig-module.install"

_extramodules=extramodules-3.18-ARCH

build() {
  cd "${srcdir}/sysdig-${pkgver}"
  mkdir -p build
  cd build
  cmake -DSYSDIG_VERSION="${pkgver}" ..
  cd driver
  make
}

package() {
  cd "${srcdir}/sysdig-${pkgver}"
  cd build/driver
  install -dm755 "${pkgdir}/usr/lib/modules/${_extramodules}/"
  install -m644 sysdig-probe.ko "${pkgdir}/usr/lib/modules/${_extramodules}/"
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} +
}

# vim:set ts=8 sts=2 sw=2 et:
