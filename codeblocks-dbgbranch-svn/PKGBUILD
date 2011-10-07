pkgname=codeblocks-dbgbranch-svn
pkgver=7478
pkgrel=1
pkgdesc="An open source and cross-platform C/C++ IDE - Debugger Branch"
arch=('i686' 'x86_64')
url="http://www.codeblocks.org"
license=('GPL3')
depends=('wxgtk' 'hicolor-icon-theme' 'bzip2' 'shared-mime-info' 'gdb' 'gamin')
makedepends=('subversion' 'zip')
optdepends=('valgrind')
provides=('codeblocks')
conflicts=('codeblocks' 'codeblocks-svn' 'codeblocks-trunk' 'codeblocks-svn-noplugins')
options=(!libtool)
source=()
md5sums=()

_svntrunk="http://svn.berlios.de/svnroot/repos/codeblocks/branches/wxpropgrid_debugger"
_svnmod=codeblocks-dbgbranch-svn

build() {
  cd ${srcdir} || return 1

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up)
  else
    svn co -r ${pkgver} ${_svntrunk} ${_svnmod}
  fi

  cd ${_svnmod}

  ./bootstrap || return 1

  ./configure --prefix=/usr --with-contrib-plugins=all,-NassiShneiderman || return 1
  make clean
  make clean-bin
  make clean-zipfiles
  make distclean

  ./configure --prefix=/usr --with-contrib-plugins=all,-NassiShneiderman || return 1
  make -j3 || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
