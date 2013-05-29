# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# You can change it to for example RelWithDebInfo to help with debugging.

_buildtype="Release"

##############################################################

_pkgname=libechonest
pkgname=${_pkgname}2
pkgver=2.1.0
pkgrel=1
pkgdesc="C++ library for interfacing with Echo Nest"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/libs/libechonest"
license=('GPL')
depends=('qjson')
makedepends=('cmake' 'pkg-config')
provides=('libechonest')
conflicts=('libechonest-git' 'libechonest')
options=(!strip)
source=("http://files.lfranchi.com/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('96d98dbc5b3b155b277a9901d1133c5e')

# Clean options array to strip pkg if release buildtype is chosen
if [[ ${_buildtype} == "Release" ]] || [[ ${_buildtype} == "release" ]]; then
  options=()
fi

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  if [[ -e ${srcdir}/${_pkgname}-${pkgver}-build ]]; then rm -rf ${srcdir}/${_pkgname}-${pkgver}-build; fi
  mkdir ${srcdir}/${_pkgname}-${pkgver}-build
  cd ${srcdir}/${_pkgname}-${pkgver}-build

  cmake -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=${_buildtype} \
        ../${_pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}-build
  make DESTDIR=${pkgdir} install
}
