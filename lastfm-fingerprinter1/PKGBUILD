# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Default is RelWithDebInfo to help with debugging.

_buildtype="Release"

##############################################################

_pkgname=liblastfm
pkgname=lastfm-fingerprinter1
pkgver=1.0.3
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/lastfm/${_pkgname}/"
license=('GPL3')
depends=('libsamplerate' 'fftw' 'liblastfm1')
makedepends=('lsb-release' 'cmake')
pkgdesc="An official Last.fm fingerprinter written in Qt/C++"
provides=('lastfm-fingerprinter')
conflicts=('lastfm-fingerprinter-git')
source=("https://github.com/lastfm/${_pkgname}/zipball/${pkgver}")
_ziphash=18f1cd1
md5sums=('b58b6201ad48c6d20fbe1cc0696ffcdc')

build() {
  if [[ -e ${srcdir}/${_pkgname}-${pkgver}-build ]]; then rm -rf ${srcdir}/${_pkgname}-${pkgver}-build; else mv ${srcdir}/lastfm-${_pkgname}-${_ziphash} ${srcdir}/${_pkgname}-${pkgver}; fi
  mkdir ${srcdir}/${_pkgname}-${pkgver}-build
  cd ${srcdir}/${_pkgname}-${pkgver}-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib/${_pkgname} \
        -DBUILD_FINGERPRINT=on \
        -DCMAKE_BUILD_TYPE=${_buildtype} \
        ../${_pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}-build/src/fingerprint/
  make DESTDIR=${pkgdir} install
}
