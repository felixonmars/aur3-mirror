pkgname=kdevelop-extra-plugins-erlang-svn
pkgver=20102306
pkgrel=1
pkgdesc="Erlang plugin for Kdevelop"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
depends=('kdevelop-git')
makedepends=('cmake' 'automoc4' 'kdevelop-pg-qt-git')
source=()
md5sums=()

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/playground/devtools/kdevelop4-extra-plugins/erlang"
_svnmod="kdevelop-erlang"

build() {
  cd "${srcdir}"
  msg "Connecting to ${_svntrunk}...."
  if [ -d ${_svnmod}/.svn ]; then
        cd ${_svnmod} && svn up -r $pkgver
  else
        svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/build

  mkdir -p ${srcdir}/build
  cd ${srcdir}/build

  cmake ../${_svnmod} -DCMAKE_INSTALL_PREFIX=/usr || return 1

  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}