# Maintainer: Bjoern Franke <bjo@nord-west.org>
# Contributor: Cédric Bellegarde <gnumdk@gmail.com>
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
pkgname=owncloud-client-fdo
pkgver=1.2.5
pkgrel=1
pkgdesc="ownCloud client based on mirall with Free Desktop notifications"
arch=('i686' 'x86_64')
url="http://owncloud.org/"
license=('GPL2')
depends=('qt4' 'ocsync')
makedepends=('cmake')
provides=('mirall' 'owncloud-client')
conflicts=('mirall-git' 'owncloud-client')
install=owncloud-client.install
backup=('etc/owncloud-client/sync-exclude.lst')
source=("http://download.owncloud.com/download/${_name}-${pkgver}.tar.bz2"
        "${pkgname}.desktop" "mirall_notification.diff")
md5sums=('2279761b409238f5c92507ba8062be4a'
         'e223d162626c2ff54efebaa90a182d81'
	 '7198c2f1cb64ca7bfaeb7cb6bb1b0cd3')

# Clean options array to strip pkg if release buildtype is chosen
if [[ ${_buildtype} == "Release" ]] || [[ ${_buildtype} == "release" ]]; then
  options=()
fi

build() {
  cd ${srcdir}/${_name}-${pkgver}
  patch -p1 < ../../mirall_notification.diff
  if [[ -e ${srcdir}/${_name}-${pkgver}-build ]]; then rm -rf ${srcdir}/${_name}-${pkgver}-build; fi
  mkdir ${srcdir}/${_name}-${pkgver}-build
  cd ${srcdir}/${_name}-${pkgver}-build

  cmake -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_BUILD_TYPE=${_buildtype} \
        -DCSYNC_INCLUDE_PATH=/usr/include/ocsync \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc/${pkgname} \
        ../${_name}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${_name}-${pkgver}-build
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
