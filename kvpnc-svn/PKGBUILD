pkgname=kvpnc-svn
pkgver=1087151
pkgrel=1
pkgdesc="KDE VPN client, svn version"                                                                                         
arch=('i686' 'x86_64')
url="http://gna.org/kvpnc"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
install=kvpnc.install
conflicts=('kvpnc')
provides=('kvpnc')

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/playground/network/kvpnc"
_svnmod="kvpnc-kde4"


build() {
msg "Downloading from ${_svntrunk} ..."
  cd ${srcdir}
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi
msg2 "SVN checkout done or server timeout"

msg "Creating temporary build directory..."
  rm -Rf ${_svnmod}-build
  cp -r ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

msg "Building and installing..."  
  cd $srcdir/${pkgname}-${pkgver}-kde4
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
msg "Removing build directory..."
  cd ${srcdir}
  rm -Rf ${_svnmod}-build
}
