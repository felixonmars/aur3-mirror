# Contributor: bleichmittel
pkgname=kommute
orgname=Kommute
pkgver=0.22
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

svntrunk=https://kommute.svn.sourceforge.net/svnroot/kommute/branches/rel_${pkgver}
svnmod=kommute

build() {
  cd ${srcdir}

  msg "svn export $svntrunk $svnmod"
  svn export $svntrunk $svnmod

  msg "SVN export done or server timeout"
  msg "Starting make..."

  cp -r $svnmod $svnmod-build
  cd $svnmod-build/kommute

  qmake || return 1
  make || return 1
  cd src
  lrelease src.pro
  cd ..
  qmake || return 1
  make INSTALL_ROOT=${pkgdir} install || return 1

  rm -rf ${srcdir}/$svnmod-build
}

