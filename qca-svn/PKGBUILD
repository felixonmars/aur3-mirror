# Contributor: Lawrence Lee <valheru@facticius.net>
pkgname=qca-svn
pkgver=660175
pkgrel=1
pkgdesc="Qca"
arch=('i686')
url="http://www.kde.org/"
license=('GPL')
depends=('qt-copy-svn' 'libgcrypt' 'openssl' 'nss' 'libsasl')
makedepends=(subversion)
provides=(qca)
conflicts=(qca)
replaces=(qca)
source=()
groups=(kde4)
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/kdesupport/qca
_svnmod=qca
md5sums=()

build() {
  [ "$QTDIR" = "" ] && source /etc/profile.d/qt4.sh

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

  cmake $startdir/src/$_svnmod -DCMAKE_INSTALL_PREFIX=/opt/qt4 -DCMAKE_BUILD_TYPE=debugfull

  make VERBOSE=1 || return 1
  make DESTDIR=$startdir/pkg install || return 1

  #clean up build directory
  rm -rf $startdir/src/$_svnmod-build
}
