# Contributor: fancris3 <fancris3 at aol.com>
pkgname=nao-svn
pkgver=0.4
pkgrel=1
pkgdesc="a file manager which features support for a two panel view and a single panel view"
arch=(i686 x86_64)
url="http://nao.linux.pl/"
license=('GPL')
depends=('python' 'fox' 'libxml2' 'openssl' 'boost' 'file')
makedepends=('autoconf')
source=()
options=('!libtool')
md5sums=()

_svntrunk=http://svn.gna.org/svn/nao/trunk
_svnmod=nao

build() {
  cd $startdir/src
  svn co $_svntrunk $_svnmod
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  sh autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc/nao --enable-python --with-ssl
  make || return 1
  make DESTDIR=$startdir/pkg install

  rm -rf $startdir/src/$_svnmod-build
}
