#Contributor: Mario Vazquez <mariovazq@gmail.com> 
pkgname=tls-cvs
pkgver=20080127
pkgrel=1
pkgdesc="OpenSSL extension to Tcl from CVS"
arch=('i686' 'x86_64')
url="http://tls.sourceforge.net/"
license=('BSD License')
depends=('tcl' 'openssl>=0.9.8b' 'awk')
makedepends=()
conflicts=('tls')
provides=('tls')
replaces=()
backup=()
source=()
md5sums=()

_cvsroot=:pserver:anonymous@tls.cvs.sourceforge.net:/cvsroot/tls
_cvsmod=tls

build() {
  cd $startdir/src
  msg "Connecting to tls CVS server......."
  cvs -z3 -d $_cvsroot co -P $_cvsmod
  msg "CVS checkout done or server timeout"
  msg "Starting make..."
  if [ -e $startdir/src/$_cvsmod-build ]; then
  	rm -rf $startdir/src/$_cvsmod-build
  fi
  cp -r $startdir/src/$_cvsmod $startdir/src/$_cvsmod-build
  cd $startdir/src/$_cvsmod-build
  
  ./configure --prefix=/usr --with-ssl-dir=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
