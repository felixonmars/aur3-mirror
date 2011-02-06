# Contributor: yannsen <ynnsen@gmail.com>
pkgname=edytornc-svn
pkgver=54
pkgrel=1
pkgdesc="A text editor for CNC programmers"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/edytornc/"
license=('GPL')
depends=('qt>=4.6')
makedepends=(subversion)
provides=(edytornc)
conflicts=(edytornc)

_svntrunk="https://edytornc.svn.sourceforge.net/svnroot/edytornc"
_svnmod=edytornc

build() {
  cd $startdir/src
  msg "Connecting to SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  if [ -d "${srcdir}/${_svnmod}-build" ]; then
    rm -rf "${srcdir}/${_svnmod}-build"
  fi

  svn export $_svnmod $_svnmod-build
  cd $_svnmod-build
  
  cd $srcdir/$_svnmod
  qmake -unix -o Makefile edytornc.pro
  cd $srcdir/$_svnmod/src/
  qmake -unix -o Makefile src.pro
 
  make clean
  make
  }

package() {
  cd "$srcdir/$_svnmod"
  install -d $pkgdir/usr/bin/
  install -m755 $srcdir/$_svnmod/bin/$CARCH/edytornc $pkgdir/usr/bin/
}

# vim:set ts=2 sw=2 et:
