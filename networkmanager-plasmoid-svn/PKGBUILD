# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>                                                                                                                                                        

pkgname=networkmanager-plasmoid-svn
pkgver=1007572
pkgrel=1
pkgdesc="KDE4 NetworkManager plasmoid"
arch=('i686' 'x86_64')
url="http://plasma.kde.org/"
license=('GPL')
depends=('kdelibs>=4.3.0' 'kdebase-workspace>=4.3.0' 'networkmanager>=0.7.1')
makedepends=('cmake' 'subversion' 'python' 'automoc4')
optdepends=('networkmanager-openvpn-kde:     for OpenVPN support')
source=()
md5sums=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/networkmanager
_svnmod=networkmanager

build() {
  cd ${srcdir}
  rm -rf ${srcdir}/build

  if [ -d ${_svnmod} ]; then
    msg "Updating SVN tree ..."
    cd ${_svnmod}
    svn revert -R .
    svn up -r ${pkgver} || return 1
    msg "SVN update finished, starting build ..."
  else
    msg "Doing SVN checkout ..."
    svn co ${_svntrunk} ${_svnmod} -r ${pkgver} || return 1
    cd ${_svnmod}
    msg "SVN checkout finished, starting build ..."
  fi

  mkdir -p ${srcdir}/build
  cd ${srcdir}/build

  cmake ../${_svnmod} -DCMAKE_INSTALL_PREFIX=/usr -DDBUS_SYSTEM_POLICY_DIR=/etc/dbus-1/system.d -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
