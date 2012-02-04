# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=qsvn-svn
pkgver=1043
pkgrel=1
pkgdesc="SVN version of Qt4 GUI for Subversion."
arch=('i686' 'x86_64')
url="http://ar.oszine.de/projects/qsvn"
license=('GPL')
depends=('qt4' 'subversion')
makedepends=('cmake' 'sed')
provides=('qsvn')
conflicts=('qsvn')

source=()
md5sums=()

_svntrunk=http://www.anrichter.net/svn/qsvn/trunk
_svnmod=qsvn

build() {
  cd "${srcdir}"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -r "${srcdir}/$_svnmod-build"
  cp -r "${srcdir}/$_svnmod" "${srcdir}/$_svnmod-build"

  cd "${srcdir}/$_svnmod-build/src"

  sed -i 's/qmake-qt4/qmake/' CMakeLists.txt || return 1
  sed -i 's/moc-qt4/moc/' CMakeLists.txt || return 1
  sed -i 's/uic-qt4/uic/' CMakeLists.txt || return 1

  cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX:PATH=/usr . || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install
}
