# Maintainer: Tom Swartz <tom.swartz07+aur@gmail.com>
# Code hosted: https://github.com/tomswartz07/owncloud-PKGBUILD
# Previous Contributor Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Default is RelWithDebInfo to help with debugging.

_buildtype="Release"

##############################################################

_name=owncloudclient
pkgname=owncloud-client-beta
pkgver=1.8.1rc2
pkgrel=2
pkgdesc="ownCloud client based on mirall. Beta version."
arch=('i686' 'x86_64' 'armv7h')
url="http://owncloud.org/"
license=('GPL2')
depends=('qtkeychain-qt5' 'neon' 'qt5-base' 'qtwebkit')
makedepends=('cmake' 'qt5-tools')
provides=('owncloudcmd' 'ocsync' 'owncloud-client')
conflicts=('owncloud-client-git' 'owncloud-client-qt5' 'owncloud-client')
replaces=('owncloud-client')
install=owncloudclient.install
backup=("etc/ownCloud/sync-exclude.lst")
source=("http://download.owncloud.com/desktop/testing/${_name}-${pkgver}.tar.xz")
md5sums=('18f0c0bab4248a36f204ea14b7598cd5')

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
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=${_buildtype} \
        -DSYSCONF_INSTALL_DIR=/etc \
        -DAPPLICATION_SHORTNAME=ownCloud \
        ../${_name}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${_name}-${pkgver}-build
  make DESTDIR="${pkgdir}/" install
}
