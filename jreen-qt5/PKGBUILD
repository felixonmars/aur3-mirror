# Maintainer: Christian Muehlhaeuser <muesli@gmail.com>
# https://github.com/muesli/pkgbuilds

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.

_buildtype='Release'

##############################################################

pkgname=jreen-qt5
pkgver=1.2.0
pkgrel=1
pkgdesc='Free and Opensource Jabber library, written in C++ using cross-platform framework Qt.'
arch=('i686' 'x86_64')
url='http://qutim.org/jreen'
license=('GPL2')
depends=('gsasl' 'speex' 'qt5-base')
makedepends=('cmake')
conflicts=('jreen-qt5-git')
source=("jreen-${pkgver}.zip::http://github.com/euroelessar/jreen/archive/v${pkgver}.zip")
md5sums=('1ac6d90d17371288bebe3fc1921a977c')

if [[ ! ${_buildtype} == 'Release' ]] && [[ ! ${_buildtype} == 'release' ]]; then
  options=('debug')
fi

prepare() {
  if [[ -e ${srcdir}/jreen-${pkgver}-build ]]; then rm -rf ${srcdir}/jreen-${pkgver}-build; fi
  mkdir ${srcdir}/jreen-${pkgver}-build
}

build() {
  cd ${srcdir}/jreen-${pkgver}-build

  cmake -DJREEN_FORCE_QT4=off \
        -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=${_buildtype} \
        ../jreen-${pkgver}

  make
}

package() {
  cd ${srcdir}/jreen-${pkgver}-build
  make DESTDIR=${pkgdir} install
}
