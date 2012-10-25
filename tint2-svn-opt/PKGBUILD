# Maintainer: Chen Zhiqiang <chenzhiqiang@mail.com>

pkgname=tint2-svn-opt
pkgver=652
pkgrel=1
pkgdesc="A basic, good-looking task manager for WMs."
arch=('i686' 'x86_64')
url="http://code.google.com/p/tint2/"
license=('GPL')
depends=('libxcomposite' 'libxdamage' 'libxinerama' 'libxrandr' 'pango' 'imlib2')
makedepends=('cmake' 'subversion')
options=('!libtool')
provides=('tint2')
source=()
md5sums=()

_svnmod="tint2"
_svntrunk="http://tint2.googlecode.com/svn/trunk"
_appdir="/opt/googlecode.com/tint2"

_checkout() {
  msg "Getting sources..."
  cd ${srcdir}
  if [ -d ${_svnmod}/.svn ]; then
    cd ${_svnmod} && svn up
  else
    svn co ${_svntrunk} ${_svnmod}
  fi
  msg "SVN checkout done or server timeout"
}

build() {
  _checkout

  msg "Starting make..."

  cd ${srcdir}
  [ -d  ${_svnmod}-build ] && rm -fr ${_svnmod}-build
  cp -R ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

  cmake . -DCMAKE_INSTALL_PREFIX=$_appdir -DSYSCONFDIR=$_appdir/etc

  make DESTDIR=${pkgdir} install
}

package() {
  mkdir -p $pkgdir/usr/local/{bin,share}
  ln -sf $_appdir/bin/{tint2,tint2conf,tintwizard.py} $pkgdir/usr/local/bin/
  mkdir -p $pkgdir/usr/local/share/icons/hicolor/scalable/apps
  ln -sf $_appdir/share/icons/hicolor/scalable/apps/taskbar.svg $pkgdir/usr/local/share/icons/hicolor/scalable/apps/
  mkdir -p $pkgdir/usr/local/share/applications
  ln -sf $_appdir/share/applications/tint2conf.desktop $pkgdir/usr/local/share/applications/
  mkdir -p $pkgdir/usr/local/share/man/man1
  ln -sf $_appdir/share/man/man1/tint2.1 $pkgdir/usr/local/share/man/man1/
}

