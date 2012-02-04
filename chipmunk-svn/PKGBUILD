# Contributor: Andreas Krinke <andreas dot krinke at gmx dot de>
pkgname=chipmunk-svn
pkgver=208
pkgrel=1
pkgdesc="A high-performance 2D rigid body physics library"
arch=('i686' 'x86_64')
url="http://code.google.com/p/chipmunk-physics/"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'subversion')
conflicts=('chipmunk')
provides=('chipmunk')

source=()
md5sums=()

_svntrunk="http://chipmunk-physics.googlecode.com/svn/trunk/"
_svnmod=chipmunk-svn

build() {
  cd $srcdir
  
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co -r $pkgver $_svntrunk $_svnmod
  fi
  
  cd $_svnmod

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make || return 1
  mkdir -p $pkgdir/usr/share/licenses/chipmunk-svn
  cp LICENSE.txt $pkgdir/usr/share/licenses/chipmunk-svn/LICENSE
  make DESTDIR=$pkgdir install 
}
