pkgname=google-gdata-sharp-svn
pkgver=988
pkgrel=1
pkgdesc="GData .NET Client Library"
url="http://code.google.com/p/google-gdata/"
arch=('i686' 'x86_64')
license=('Apache 2.0')
makedepends=('subversion')
depends=('mono')

_svnmod="google-gdata"
_svntrunk="http://google-gdata.googlecode.com/svn/trunk/"

build() {
  cd $startdir/src
  svn co $_svntrunk $_svnmod
  cd $_svnmod/clients/cs

  #Fixing install prefix
  sed -i 's/PREFIX=\/usr\/local/PREFIX=\/usr/' Makefile
  #Suppress installation of tests and docs
  sed -i '0,/tests/s///' Makefile
  sed -i '/Documents/d' Makefile  

  make
  make DESTDIR=$pkgdir install
}
