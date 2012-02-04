# Contributor: bleichmittel
pkgname=kommute-svn
pkgver=329
pkgrel=1
pkgdesc="Kommute is a p2p-client for the MUTE-network based on qt4."
arch=('i686' 'x86_64')
url="http://kommute.sourceforge.net"
license=('GPL')
groups=()
depends=('qt' 'gcc-libs')
makedepends=('svn')
provides=('kommute')
conflicts=('kommute')
replaces=()
backup=()
install=()
source=()
noextract=()
md5sums=()

_svntrunk=https://kommute.svn.sourceforge.net/svnroot/kommute
_svnmod=kommute

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build/trunk/kommute

  qmake || return 1
  make || return 1
  qmake || return 1
  make INSTALL_ROOT=${pkgdir} install || return 1

  rm -rf ${srcdir}/$_svnmod-build
}