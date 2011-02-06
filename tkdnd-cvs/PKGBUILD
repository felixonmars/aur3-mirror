# Contributor: Igor "FeR" Scabini <furester@gmail.com>

pkgname=tkdnd-cvs
pkgver=2.0
pkgrel=1
pkgdesc="add native drag'n'drop capabilities to tk"
arch=('i686')
url="http://sourceforge.net/projects/tkdnd/"
license="GPL"
depends=('tk')
makedepends=('cvs')
provides=()
conflicts=()
replaces=()
install=
source=()
md5sums=()

_svnmod="tkdnd/lib"
_svntrunk=":pserver:anonymous@tkdnd.cvs.sourceforge.net:/cvsroot/tkdnd"

build() {
  cd $startdir/src

  msg "Connecting to $_svnmod.sourceforge.net SVN server...."
  cvs -z3 -d$_svntrunk login
  cvs -z3 -d$_svntrunk co -P $_svnmod

  mkdir -p $startdir/pkg/usr/share/amsn/utils/tkdnd
  cp $startdir/src/tkdnd/lib/*tcl $startdir/pkg/usr/share/amsn/utils/tkdnd/
  cp $startdir/src/tkdnd/lib/Linux/libtkdnd1.0.so $startdir/pkg/usr/share/amsn/utils/tkdnd/

}
# vim:syntax=sh
