# Contributor: Jens Pranaitis <jens@jenux.homelinux.org>
# Maintainer: Nathan Owe <ndowens04+AUR at gmail dot com>
pkgname=kblogger-svn
pkgver=992656
pkgrel=2
pkgdesc="blogging software for wordpress, blogspot, etc"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL')
depends=('kdepimlibs')
makedepends=('subversion')

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/pim/kblogger
_svnmod=kblogger

build() {
  # start building
  cd "${srcdir}"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  mkdir -p $_svnmod-build
  cd $_svnmod-build

  cmake "${srcdir}"/$_svnmod -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE

  make || return 1
  make DESTDIR=$pkgdir install || return 1

  #clean up build directory
  rm -rf "${srcdir}"/$_svnmod-build
}

