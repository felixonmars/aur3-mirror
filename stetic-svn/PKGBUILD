# Contributor: Dejan Čabrilo <dcabrilo@gmail.com>
pkgname=stetic-svn
pkgver=96889
pkgrel=1
pkgdesc="A GUI designer for creating Gtk# applications."
arch=('i686' 'x86_64')
url="http://www.mono-project.com/Stetic"
license=('GPL')
depends=('mono')
makedepends=('pkgconfig' 'svn')
conflicts=('stetic')
provides=('stetic')
source=()
md5sums=()

_svntrunk=svn://anonsvn.mono-project.com/source/trunk/stetic
_svnmod=stetic

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk -r $pkgver
  fi

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh

  ./configure --prefix=/usr
  MONO_SHARED_DIR=/tmp make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  rm -rf $startdir/src/$_svnmod-build
}
