# Maintainer: steabert <steabert@member.fsf.org>
pkgname=qcachegrind-svn
pkgver=1239972
pkgrel=1
pkgdesc="Visualization of Performance Profiling Data (Qt version)"
arch=('i686' 'x86_64')
url="http://kcachegrind.sourceforge.net"
license=('GPL')
groups=()
depends=('qt>=4.5')
makedepends=('gcc' 'make' 'pkg-config' 'subversion' 'qt')
optdepends=('graphviz')
provides=('qcachegrind')
conflicts=('qcachegrind')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/KDE/kdesdk/kcachegrind"
_svnmod="kcachegrind"

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  mkdir "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  qmake ../$_svnmod/qcg.pro
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  install -D -m 755 -p qcachegrind/qcachegrind "$pkgdir/usr/bin/qcachegrind"
  install -D -m 755 -p cgview/cgview "$pkgdir/usr/bin/cgview"
}
