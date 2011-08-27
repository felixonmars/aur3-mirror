# Contributor: Javier ‘Phrodo_00’ Aravena <Phrodo.00@gmail.com>
pkgname=table-svn
pkgver=1104
pkgrel=1
pkgdesc="Clutter based Surface-type toy"
arch=('i686')
url="http://njpatel.blogspot.com/2007/06/flickr-clutter-fluttr.html"
license=('GPL')
depends=('clutter>=0.3' 'clutter-gst>=0.3' 'gnome-vfs')
makedepends=('subversion')
options=('!libtool')
source=()
md5sums=()
_svntrunk=http://svn.o-hand.com/repos/clutter/trunk/toys/table
_svnmod=table

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

  make || return 1
  install -D -m755 table $startdir/pkg/usr/bin/table
  rm -rf $startdir/src/$_svnmod-build
}
