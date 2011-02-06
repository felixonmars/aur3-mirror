# Contributor: Lawrence Lee <valheru@facticius.net>
pkgname=kdeadmin4-svn
pkgver=765683
pkgrel=3
pkgdesc="KDE4 Administration Programs"
arch=('i686' 'x86_64')
url="http://www.kde.org/"
license=('GPL')
depends=('kdepimlibs4-svn')
makedepends=('subversion' 'cmake')
provides=(kdeadmin4)
conflicts=(kdeadmin4)
source=()
md5sums=()
groups=('kde4.0-svn')
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdeadmin
_svnmod=kdeadmin

build() {
  . /etc/profile.d/kde4.sh

  # start building
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  cmake $startdir/src/$_svnmod -DCMAKE_INSTALL_PREFIX=/opt/kde4 -DCMAKE_BUILD_TYPE=RELWITHDEBINFO

  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  #clean up build directory
  rm -rf $startdir/src/$_svnmod-build
}
