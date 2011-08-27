# Maintainer: Yuchen Deng <loaden@gmail.com>

pkgname=codeblocks-trunk
pkgver=6853
pkgrel=1
pkgdesc="An open source and cross-platform C/C++ IDE"
arch=('i686' 'x86_64')
url="http://www.codeblocks.org"
license=('GPL3')
depends=('wxgtk' 'hicolor-icon-theme' 'bzip2' 'shared-mime-info' 'pkgconfig' 'autoconf' 'automake' 'libtool' 'fakeroot' 'make' 'gcc' 'gdb')
makedepends=('subversion' 'zip')
optdepends=()
provides=('codeblocks')
conflicts=('codeblocks')
options=(!libtool)
source=()
md5sums=()

_svntrunk="http://svn.berlios.de/svnroot/repos/codeblocks/trunk"
_svnmod=codeblocks-trunk

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
  make -j2 || return 1
  make DESTDIR="${pkgdir}" install || return 1
}

