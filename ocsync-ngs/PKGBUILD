# Maintainer: Danilo Kuehn <dk at nogo-software dot de>
# Git: https://github.com/nogo/owncloud-client

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Default is RelWithDebInfo to help with debugging.

_buildtype="Release"

##############################################################

_name=ocsync
pkgname=ocsync-ngs
pkgver=0.80.0
pkgrel=1
pkgdesc="A file synchronizer especially designed for you, the normal user."
arch=("i686" "x86_64")
url="http://www.csync.org"
license=('GPL2')
depends=('sqlite3' 'iniparser' 'neon' 'smbclient' 'libssh')
makedepends=('cmake')
provides=('csync' 'csync-owncloud')
conflicts=('csync' 'csync-owncloud')
source=("http://download.owncloud.com/download/${_name}-${pkgver}.tar.bz2")
md5sums=('db46cdb4c710a607dfc062ed0a413b35')

# Clean options array to strip pkg if release buildtype is chosen
if [[ ${_buildtype} == "Release" ]] || [[ ${_buildtype} == "release" ]]; then
  options=()
fi

build() {
  if [[ -e ${srcdir}/${_name}-${pkgver}-build ]]; then rm -rf ${srcdir}/${_name}-${pkgver}-build; fi
  mkdir ${srcdir}/${_name}-${pkgver}-build
  cd ${srcdir}/${_name}-${pkgver}-build

  cmake -DCMAKE_BUILD_TYPE=${_buildtype} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSYSCONF_INSTALL_DIR=/etc \
        ../${_name}-${pkgver}
  make
}
package() {
  cd ${srcdir}/${_name}-${pkgver}-build
  make DESTDIR=${pkgdir} install
}
