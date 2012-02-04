# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: BlackEnvil <BlackEnvil@gmail.com>
# Contributor: vinc94 <vinc94@gmail.com>

pkgname=codeblocks-svn-noplugins
pkgver=6178
pkgrel=1
pkgdesc="An open source and cross-platform C/C++ IDE - no contrib plugins"
arch=('i686' 'x86_64')
url="http://www.codeblocks.org"
license=('GPL')
makedepends=('subversion' 'zip')
depends=('wxgtk')
provides=('codeblocks')
conflicts=('codeblocks' 'codeblocks-svn')
source=()
md5sums=()

_svntrunk="http://svn.berlios.de/svnroot/repos/codeblocks/trunk"
_svnmod=codeblocks-svn

build() {
  cd ${srcdir} || return 1

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up)
  else
    svn co -r ${pkgver} ${_svntrunk} ${_svnmod}
  fi

  cd ${_svnmod}

  ./bootstrap || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}

