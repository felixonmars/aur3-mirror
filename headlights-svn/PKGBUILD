#Contributor: Peter Garceau <pgarceau@gmail.com>
pkgname=headlights-svn
pkgver=33
pkgrel=1
pkgdesc="A simple app for checking if Aur Packages are up to date"
url="http://code.google.com/p/headlights"
makedepends=('subversion')
depends=('wxpython')
conflicts=('headlights')
provides=('headlights')
arch=('i686')
license=('GPL')
source=()
md5sums=()

_svntrunk=http://headlights.googlecode.com/svn/trunk/
_svnmod=headlights

build() {
  cd $startdir/src/

  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  touch $_svnmod-build
  rm -rf $_svnmod-build
  cp -a $_svnmod $_svnmod-build
  cd $_svnmod-build

  mkdir -p $startdir/pkg/usr/lib/python2.5/site-packages/headlights
  install -D -m755 headlights.py $startdir/pkg/usr/lib/python2.5/site-packages/headlights/
  install -D -m755 urlPacs.py $startdir/pkg/usr/lib/python2.5/site-packages/headlights/
  install -D -m755 localPacs.py $startdir/pkg/usr/lib/python2.5/site-packages/headlights/

  mkdir $startdir/pkg/usr/bin
  ln -s ../lib/python2.5/site-packages/headlights/headlights.py $startdir/pkg/usr/bin/headlights

  install -D -m644 $startdir/src/$_svnmod-build/headlights.png \
    $startdir/pkg/usr/share/pixmaps/headlights.png

  install -D -m644 $startdir/headlights.desktop \
    $startdir/pkg/usr/share/applications/headlights.desktop
}
