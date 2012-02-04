pkgname=libqq2010-svn
pkgver=80
pkgrel=1
arch=('i686' 'x86_64')
url="http://code.google.com/p/libqq-pidgin/"
pkgdesc="Latest QQ 2010 protocol for pidgin"
license=('GPLv3')
depends=( )
makedepends=('libpurple')
conflicts=('libqq-pidgin' 'libqq-svn')
provides=('libqq-pidgin')
options=('!libtool')
source=(Makefile.patch)
md5sums=(3f20bbc821ab0c739544d299e681d001)
_svntrunk=http://libqq-pidgin.googlecode.com/svn/trunk/
_svnmod=libqq-pidgin

build() {
 svn co $_svntrunk $_svnmod
 cd ${srcdir}/libqq-pidgin
 sh autogen.sh
 patch  < ../Makefile.patch ||return 1
  ./configure --prefix=/usr --sysconfdir=/etc CFLAGS="-g3 -O0"
  make
}
package(){
  cd ${srcdir}/libqq-pidgin
  make DESTDIR=$pkgdir install
  rm -rf ${srcdir}/$_svnmod
}
