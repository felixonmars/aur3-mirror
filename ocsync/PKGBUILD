# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Default is RelWithDebInfo to help with debugging.

_buildtype='Release'

##############################################################

pkgname=ocsync
pkgver=0.91.4
pkgrel=2
pkgdesc='A file synchronizer especially designed for you, the normal user. Dependency of owncloud-client.'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.csync.org'
license=('GPL2')
depends=('sqlite3' 'iniparser' 'neon' 'libssh')
makedepends=('cmake')
provides=('csync' 'csync-owncloud')
conflicts=('csync' 'csync-owncloud')
options=('staticlibs')
backup=('etc/ocsync/ocsync.conf' 'etc/ocsync/ocsync_exclude.conf')
source=("http://download.owncloud.com/desktop/stable/${pkgname}-${pkgver}.tar.bz2")
md5sums=('3f9bf0b0b131d984aa0574800b77e874')

if [[ ! ${_buildtype} == 'Release' ]] && [[ ! ${_buildtype} == 'release' ]]; then
  options+=('debug')
fi

prepare() {
  if [[ -e ${srcdir}/${pkgname}-${pkgver}-build ]]; then rm -rf ${srcdir}/${pkgname}-${pkgver}-build; fi
  mkdir ${srcdir}/${pkgname}-${pkgver}-build
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}-build
  
  cmake -DCMAKE_BUILD_TYPE=${_buildtype} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSYSCONF_INSTALL_DIR=/etc \
        ../${pkgname}-${pkgver}
  make
}
package() {
  cd ${srcdir}/${pkgname}-${pkgver}-build
  make DESTDIR=${pkgdir} install
}
