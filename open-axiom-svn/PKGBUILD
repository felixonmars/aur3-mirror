# contributor: Stefan Mai (iamnafets@gmail.com)
pkgname=open-axiom-svn
pkgver=1082
pkgrel=1
pkgdesc="Open source computer algebra system."
arch=('i686' 'x86_64')
url="http://www.open-axiom.org"
license=('GPL2')
depends=('sbcl' 'noweb' )
makedepends=(subversion noweb)
provides=(open-axiom-svn)
conflicts=(open-axiom)
source=()
md5sums=() 

_svntrunk="https://open-axiom.svn.sourceforge.net/svnroot/open-axiom/trunk"
_svnmod=open-axiom

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
  # BUILD
  mkdir -pv $_svnmod-build
  cd $_svnmod-build
  ../$_svnmod/configure --with-lisp=sbcl --prefix=/usr
  make
  make install
}
