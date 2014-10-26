# Maintainer: Yoann Laissus <yoann dot laissus at gmail dot com"
# Contributor Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Default is RelWithDebInfo to help with debugging.

_buildtype="Release"

##############################################################

_name=mirall
pkgname=owncloud-client-beta
pkgver=1.7.0rc1
pkgrel=1
pkgdesc="ownCloud client based on mirall. Beta version."
arch=('i686' 'x86_64' 'armv7h')
url="http://owncloud.org/"
license=('GPL2')
depends=('qtkeychain-qt5' 'neon' 'qt5-base')
makedepends=('cmake' 'qt5-tools')
provides=('mirall' 'ocsync' 'owncloud-client')
conflicts=('mirall-git' 'owncloud-client')
install=owncloud-client.install
backup=("etc/ownCloud/sync-exclude.lst")
source=("http://download.owncloud.com/download/testing/${_name}-${pkgver}.tar.bz2")
md5sums=('d7f68d35d172ca00a7b04c2552ac9b4b')

if [[ ! ${_buildtype} == "Release" ]] && [[ ! ${_buildtype} == "release" ]]; then
  options=(!strip)
fi

prepare() {
  if [[ -e ${srcdir}/${_name}-${pkgver}-build ]]; then rm -rf ${srcdir}/${_name}-${pkgver}-build; fi
  mkdir ${srcdir}/${_name}-${pkgver}-build
}

build() {
  cd ${srcdir}/${_name}-${pkgver}-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=${_buildtype} \
        -DSYSCONF_INSTALL_DIR=/etc \
        -DAPPLICATION_SHORTNAME=ownCloud \
        ../${_name}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${_name}-${pkgver}-build
  make DESTDIR=${pkgdir} install
}
