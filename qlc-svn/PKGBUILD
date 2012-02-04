# Maintainer: Maximilian Guentner <maximilian.guentner@gmail.com>

pkgname=qlc-svn
pkgver=2439
pkgrel=1
pkgdesc="Q Light Controller: a cross-platform application for controlling DMX or analog lighting systems"
arch=('i686' 'x86_64')
url="http://qlc.sourceforge.net"
license=('GPL2' )
depends=('qt' 'libftdi' 'shared-mime-info')
optdepends=('ola')
makedepends=('subversion')
provides=('qlc')
install=${pkgname}.install
_svntrunk=https://qlc.svn.sourceforge.net/svnroot/qlc/trunk
_svnmod=trunk

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver 
  fi

  # Create copy for build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  sed -i '/QMAKE_CXXFLAGS += -Werror/ a\QMAKE_CXXFLAGS += -Wno-error=unused-but-set-variable' variables.pri
  qmake INSTALL_ROOT=$pkgdir || return 1
  make INSTALL_ROOT=$pkgdir || return 1
  make INSTALL_ROOT=$pkgdir install || return 1
  rm -rf ${srcdir}/$_svnmod-build
}
