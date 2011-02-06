# Contributor: dhampire <dhamp@ya.ru>
pkgname=dclib-svn
pkgver=555
pkgrel=1
pkgdesc="Library for Eiskaltdc."
license=('GPL3')
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/eiskaltdc/"
depends=('openssl' 'bzip2' 'libxml2')
makedepends=('autoconf' 'automake' 'subversion' 'gcc')
_svntrunk="https://eiskaltdc.svn.sourceforge.net/svnroot/eiskaltdc/dclib"
_svnmod=dclib

build() {
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
     (cd $_svnmod && svn up -r $pkgver)
  else
     svn co $_svntrunk $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  rm -rf $srcdir/$_svnmod-build
  cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
  cd $_svnmod-build
  autoreconf --verbose --install
  ./configure --prefix=/usr
  make DESTDIR="${pkgdir}" install || return 1
  rm -rf $srcdir/$pkgname-build
}
