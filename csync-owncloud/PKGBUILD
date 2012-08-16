# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Default is RelWithDebInfo to help with debugging.

_buildtype="RelWithDebInfo"

##############################################################

_name=csync
pkgname=csync-owncloud
pkgver=0.50.8
pkgrel=1
pkgdesc="A file synchronizer especially designed for you, the normal user."
arch=("i686" "x86_64")
url="http://www.csync.org"
license=('GPL2')
depends=('log4c' 'sqlite3' 'iniparser' 'neon' 'smbclient' 'libssh')
makedepends=('cmake')
#optdepends=('samba: smb support' 'libssh: sftp support')
provides=('csync')
conflicts=('csync')
options=(!strip)
source=("http://download.owncloud.com/download/${_name}-${pkgver}.tar.bz2")
md5sums=('322f6fa22ca0e8cd05f23dc0d075e7ca')

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
        -DLOG_TO_CALLBACK=on \
        ../${_name}-${pkgver}
  make
}
package() {
  cd ${srcdir}/${_name}-${pkgver}-build
  make DESTDIR=${pkgdir} install
}
