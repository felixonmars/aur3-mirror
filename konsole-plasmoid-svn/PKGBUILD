# Contributor: HuangXi <huaihuaixiaoshao@gmail.com>
pkgname=konsole-plasmoid-svn
pkgver=18
pkgrel=1
pkgdesc="A simple plasmoid embedding a konsole"
arch=('i686' 'x86_64')
url="http://code.google.com/p/konsole-plasmoid"
license=('GPL')
depends=('kdebase-workspace' 'kdebase-konsole')
makedepends=('subversion' 'cmake' 'gcc' 'automoc4')
source=()
md5sums=()

_svntrunk=http://konsole-plasmoid.googlecode.com/svn/trunk/
_svnmod=konsolator

build() {

  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  mkdir build
  cd build
cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. 
#  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=$startdir/pkg/ install

  rm -rf $startdir/src/$_svnmod-build

}

