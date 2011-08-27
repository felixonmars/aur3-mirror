# Contributor: Feanor <fabio.falcinelli@gmail.com>
pkgname=imlib2-svn
pkgver=35903
pkgrel=3
pkgdesc="Imlib2 is the successor to Imlib. It is NOT a newer version"
arch=('i686' 'x86_64')
license=('BSD')
url="http://www.enlightenment.org"
makedepends=('svn')
conflicts=('imlib2')
provides=('imlib2')
replaces=('imlib2-cvs')
depends=('libjpeg' 'libpng' 'freetype2')
source=()
md5sums=()

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/imlib2"
_svnmod="imlib2"

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
  make DESTDIR=$startdir/pkg install || return 1

# install license files
  install -D -m644 $startdir/src/$_svnmod-build/AUTHORS $startdir/pkg/usr/share/licenses/$pkgname/AUTHORS
  install -D -m644 $startdir/src/$_svnmod-build/COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
  install -D -m644 $startdir/src/$_svnmod-build/COPYING-PLAIN $startdir/pkg/usr/share/licenses/$pkgname/COPYING-PLAIN

  rm -r $srcdir/$_svnmod-build
}

