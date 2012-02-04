# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>

pkgname=kde-netbook-svn
_realname=kde-netbook
pkgver=1025286
pkgrel=1
pkgdesc="KDE for netbooks"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake'  'subversion')
provides=($_realname)
conflicts=($_realname)
source=()
md5sums=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/netbook
_svnmod=netbook

build() {
  cd ${srcdir}

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  [ -d build ] && rm -rf build

  mkdir build
  cd build 
  cmake ../${_svnmod} -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=RELEASE
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

 
}
