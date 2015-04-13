# Contributor: Calimero <calimeroteknik at free dot fr>

_pkgname=libstsound
pkgname="${_pkgname}2-git"
pkgver=0.3.0.r31.gf3ba66d
pkgrel=1
pkgdesc='Amstrad AY3-8912 audio chip emulator library'
arch=('i686' 'x86_64')
url='https://github.com/cpcsdk/cpctools'
license=('GPL')
makedepends=('git')
source=('git+https://github.com/cpcsdk/cpctools')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/cpctools/${_pkgname}"
  git describe --long --tags | sed -E 's/^cpctools-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/cpctools/${_pkgname}"

  msg 'build_config.sh…'
  ./build_config.sh

  msg './configure…'
  ./configure --prefix=/usr

  msg 'make…'
  make
}

package() {
  cd "${srcdir}/cpctools/${_pkgname}"
  make install DESTDIR="${pkgdir}"
}
