# Contributor: Javier ‘Phrodo_00’ Aravena <Phrodo.00@gmail.com>
pkgname=opt-svn
pkgver=1096
pkgrel=1
pkgdesc="An experimental toy clutter based presentaion app.."
arch=('i686')
url="http://www.clutter-project.org/"
license=('GPL')
depends=('clutter>=0.3')
makedepends=('subversion')
options=('!libtool')
source=()
md5sums=()
_svntrunk=http://svn.o-hand.com/repos/clutter/trunk/toys/opt/
_svnmod=opt

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

  ./autogen.sh

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg/ install

  rm -rf $startdir/src/$_svnmod-build
}
