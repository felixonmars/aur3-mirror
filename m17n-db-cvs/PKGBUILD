# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=m17n-db-cvs
pkgver=20100826
pkgrel=1
pkgdesc="Realizes multilingualization of many aspects - database"
arch=('i686' 'x86_64')
depends=('sh')
makedepends=('cvs')
url="http://www.m17n.org/"
license=('GPL')
conflicts=('m17n-db')
provides=('m17n-db')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@cvs.m17n.org:/cvs/m17n"
_cvsmod="m17n-db"

build() {
  cd $srcdir
  msg "Connecting to $_cvsmod CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  cp -r $srcdir/$_cvsmod $srcdir/$_cvsmod-build
  cd $srcdir/$_cvsmod-build

  #
  # BUILD HERE
  #

  ./bootstrap.sh 
  ./configure --prefix=/usr 
  sed -i 's+si-wijesekera-preedit.mim++' MIM/Makefile.am 
  make 
  make DESTDIR=$pkgdir install 
  rm -r $srcdir/$_cvsmod-build 
}
