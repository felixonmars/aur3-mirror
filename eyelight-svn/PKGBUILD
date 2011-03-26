# $Id: PKGBUILD 14603 2010-04-05 17:52:20Z rvanharen $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=eyelight-svn
pkgver=49665
pkgrel=1
pkgdesc="Eyelight is an light image viewer"
arch=('i686' 'x86_64')
groups=('e17-libs-svn' 'e17-svn')
url="http://www.enlightenment.org"
license=('BSD')
depends=('edje-svn' 'evas-svn' 'ethumb-svn' 'ecore-svn' 'eet-svn')
makedepends=('subversion' 'cvs')
conflicts=('eyelight')
provides=('eyelight')
options=('!libtool')
source=()
md5sums=()

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/PROTO/eyelight"
_svnmod="eyelight"

build() {
  cd $srcdir

  if [ $NOEXTRACT -eq 0 ]; then
    msg "Connecting to $_svntrunk SVN server...."
    if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
    else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

  fi
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  ./autogen.sh --prefix=/usr 
  make || return 1
  make DESTDIR=$pkgdir install || return 1

# install license files
  install -Dm644 $srcdir/$_svnmod-build/COPYING \
  	$pkgdir/usr/share/licenses/$pkgname/COPYING

  rm -r $startdir/src/$_svnmod-build
}
