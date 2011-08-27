# Contributor: David Pretty <david.pretty@gmail.com>
pkgname=mdsplus-cvs
pkgver=20090112
pkgrel=1
pkgdesc="Software tools for data acquisition and storage and a methodology for management of complex scientific data (CVS Version)"
arch=('i686')
url="http://www.mdsplus.org"
license=()
groups=()
depends=()
makedepends=('cvs' 'jdk' 'openmotif')
options=()
install=
source=()
md5sums=()

_cvsroot=":pserver:MDSguest:MDSguest@www.mdsplus.org:/mdsplus/repos"
_cvsmod="mdsplus"

build() {
  cd "$startdir/src/"

  msg "Trying to connect to CVS."
  cvs -d "$_cvsroot" login
  cvs -d "$_cvsroot" co -P "$_cvsmod"

  msg "CVS checkout done or server timeout"
  msg "Now starting build"

  cp -r $_cvsmod ../$_cvsmod-build
  cd ../$_cvsmod-build


  ./configure --with-jdk=/opt/java --prefix=${pkgdir}/usr/local/mdsplus
  make all || return 1
  make install || return 1
  rm -r ${startdir}/$_cvsmod-build

}
