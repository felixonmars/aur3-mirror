# Maintaineer:  Gergely Imreh <imrehgATgmailDOTcom>
# Contributor:  Gergely Imreh <imrehgATgmailDOTcom>
pkgname=libgarmin-svn
pkgver=320
pkgrel=1
pkgdesc="C library to parse and use Garmin image files."
url="http://libgarmin.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('subversion' 'autoconf')
depends=()
provides=('libgarmin')
source=()
md5sums=()
_svntrunk=http://libgarmin.svn.sourceforge.net/svnroot/libgarmin/libgarmin/dev
_svnmod=garmin

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autosh.sh

  ./configure --prefix=/usr 
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  rm -rf ${srcdir}/$_svnmod-build
}
