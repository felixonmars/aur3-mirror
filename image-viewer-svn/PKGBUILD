# Contributor: Igor Scabini <furester@gmail.com>

pkgname=image-viewer-svn
pkgver=39838
pkgrel=1
pkgdesc="An light-weight image viewer based on Elementary"
arch=('i686' 'x86_64')
url="http://enlightenment.org"
license=('GPL')
depends=('elementary')
makedepends=('svn')
provides=('image-viewer')
options=('!libtool')
install=

source=()
md5sums=()

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/PROTO/image-viewer"
_svnmod="image-viewer"

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
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  rm -r $startdir/src/$_svnmod-build
}
# vim:syntax=sh
