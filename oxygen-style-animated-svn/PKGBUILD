# Contributor: bgmiki <vmiki@gmail.com>

pkgname=oxygen-style-animated-svn
pkgver=1043633
pkgrel=1
pkgdesc="oxygen-style-animated for KDE4"
arch=('i686' 'x86_64')
url="http://kde.org"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'subversion')
conflicts=()

_svntrunk=svn://anonsvn.kde.org/home/kde/branches/work/oxygen-style-animated
_svnmod=oxygen-style-animated

build() {
  # start building
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod
  
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`

  make -j4 || return 1
  make DESTDIR=$startdir/pkg install || return 1

}
