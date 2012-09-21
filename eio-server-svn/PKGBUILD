# Maintainer: kuri <sysegv@gmail.com>

pkgname=eio-server-svn
pkgver=76634
pkgrel=1
pkgdesc="Async IO library, This package is for use with ecore-server-svn because eio-svn depends on ecore-svn"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('ecore')
makedepends=('subversion')
conflicts=('eio')
provides=('eio')
options=(!libtool)
source=()
md5sums=()

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/eio"
_svnmod="eio"

build() {
   cd $srcdir

msg "Connecting to $_svntrunk SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh --prefix=/usr
  make
}

package(){
  cd $_svnmod-build
  make DESTDIR=$pkgdir install
  
  # install license files
  install -Dm644 $srcdir/$_svnmod-build/COPYING \
  	$pkgdir/usr/share/licenses/$pkgname/COPYING
  
  rm -r $srcdir/$_svnmod-build

}
