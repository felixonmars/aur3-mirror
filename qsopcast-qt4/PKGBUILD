# Maintainer: majia321<majia321@gmail.com>

pkgname=qsopcast-qt4
pkgver=134
pkgrel=1
pkgdesc="A Qt4 front-end for sopcast"
arch=(i686 x86_64)
url="http://code.google.com/p/qsopcast/"
license=('GPL')
depends=('sopcast' 'qt')
[ "$CARCH" == "x86_64" ] && depends=('bin32-sopcast' 'qt')
makedepends=('cmake')
conflicts=()
provides=()
source=('qstring.patch')

_svnmod="qsopcast"
_svntrunk=http://qsopcast.googlecode.com/svn/trunk/

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
  
  # Thanks baghera (federico.chia@gmail.com)
  patch -Np0 < ../qstring.patch

  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=relwithdeb -DCMAKE_INSTALL_PREFIX=/usr ..
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  #cd $srcdir/gmlive-extra-0.3
  #install -Dm755 xpplive $pkgdir/usr/bin/ || return 1
  
  rm -r $startdir/src/$_svnmod-build
 }
md5sums=('a901196c41ea3bc6ed631f47b6d1f127')
