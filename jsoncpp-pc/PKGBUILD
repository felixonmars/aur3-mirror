# $Id: PKGBUILD 188521 2013-06-15 07:18:30Z andrea $
# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jonahtan Schaeffer <joschaeffer@gmail.com>
# COntributor: Drake Arconis <lightdrake@gmail.com>

_pkgname=jsoncpp
pkgname=${_pkgname}-pc
pkgver=1.0.0
pkgrel=1
pkgdesc="A JSON C++ library. pkg-config supported."
url='https://github.com/open-source-parsers/jsoncpp/'
license=('custom:Public_Domain')
arch=('i686' 'x86_64')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/open-source-parsers/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('4c886ac3bfccc867a79f3a5280ce1152')

conflicts=(${_pkgname})
provides=(${_pkgname})

_dir="${_pkgname}-${pkgver}"

build() {
  rm -rf ${srcdir}/build && mkdir -p ${srcdir}/build
  cd "${srcdir}/build"

  cmake ${srcdir}/${_dir} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DJSONCPP_LIB_BUILD_SHARED=ON

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install

  install -Dm644 "${srcdir}/${_dir}/LICENSE" "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}

