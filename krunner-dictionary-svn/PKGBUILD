# Maintainer: Marvin Frommhold

pkgname=krunner-dictionary-svn
pkgver=1160890
pkgrel=1
pkgdesc="A dictionary krunner plugin."
arch=('i686' 'x86_64')
depends=('kdebase-workspace>=4.5')
makedepends=('cmake')
url="http://blog.jasondonenfeld.com/285"
license=('GPL' 'LGPL' 'FDL')
source=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/kdereview/plasma/runners/dictionary
_svnmod=dictionary

build()
{
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build/
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release .
  make || return 1
  make DESTDIR=$pkgdir install
}

